func.func @split_vector_transfer_read_2d(%A: memref<?x8xf32>, %i: index, %j: index) -> vector<4x8xf32> {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32

  // alloca for boundary full tile
  // %i + 4 <= dim(%A, 0)
  // %j + 8 <= dim(%A, 1)
  // are both conds true
  //               inBounds, just yield %A
  //               slow path, fill tmp alloc and yield a memref_casted version of it

  %1 = vector.transfer_read %A[%i, %j], %f0 : memref<?x8xf32>, vector<4x8xf32>

  return %1: vector<4x8xf32>
}


func.func @split_vector_transfer_read_strided_2d(
    %A: memref<7x8xf32, strided<[?, 1], offset: ?>>,
    %i: index, %j: index) -> vector<4x8xf32> {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32

  // alloca for boundary full tile
  // %i + 4 <= dim(%A, 0)
  // %j + 8 <= dim(%A, 1)
  // are both conds true
  //               inBounds but not cast-compatible: yield a memref_casted form of %A
  //               slow path, fill tmp alloc and yield a memref_casted version of it
  %1 = vector.transfer_read %A[%i, %j], %f0 :
    memref<7x8xf32, strided<[?, 1], offset: ?>>, vector<4x8xf32>

  return %1 : vector<4x8xf32>
}

func.func @split_vector_transfer_read_mem_space(%A: memref<?x8xf32, 3>, %i: index, %j: index) -> vector<4x8xf32> {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32

  //               inBounds with a different memory space
  //               slow path, fill tmp alloc and yield a memref_casted version of it

  %1 = vector.transfer_read %A[%i, %j], %f0 : memref<?x8xf32, 3>, vector<4x8xf32>

  return %1: vector<4x8xf32>
}

module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%root : !transform.any_op {transform.readonly}) {
    %func_op = transform.structured.match ops{["func.func"]} in %root : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %func_op {
      transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
    } : !transform.op<"func.func">
    transform.yield
  }
}

// -----

func.func @split_vector_transfer_write_2d(%V: vector<4x8xf32>, %A: memref<?x8xf32>, %i: index, %j: index) {
  vector.transfer_write %V, %A[%i, %j] :
    vector<4x8xf32>, memref<?x8xf32>
  return
}



module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%root : !transform.any_op {transform.readonly}) {
    %func_op = transform.structured.match ops{["func.func"]} in %root : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %func_op {
      transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
    } : !transform.op<"func.func">
    transform.yield
  }
}

// -----

func.func @split_vector_transfer_write_strided_2d(
    %V: vector<4x8xf32>, %A: memref<7x8xf32, strided<[?, 1], offset: ?>>,
    %i: index, %j: index) {
  vector.transfer_write %V, %A[%i, %j] :
    vector<4x8xf32>, memref<7x8xf32, strided<[?, 1], offset: ?>>
  return
}


module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%root : !transform.any_op {transform.readonly}) {
    %func_op = transform.structured.match ops{["func.func"]} in %root : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %func_op {
      transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
    } : !transform.op<"func.func">
    transform.yield
  }
}

// -----

func.func @split_vector_transfer_write_mem_space(%V: vector<4x8xf32>, %A: memref<?x8xf32, 3>, %i: index, %j: index) {
  vector.transfer_write %V, %A[%i, %j] :
    vector<4x8xf32>, memref<?x8xf32, 3>
  return
}



module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%root : !transform.any_op {transform.readonly}) {
    %func_op = transform.structured.match ops{["func.func"]} in %root : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %func_op {
      transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
    } : !transform.op<"func.func">
    transform.yield
  }
}


// -----

func.func private @fake_side_effecting_fun(%0: vector<2x2xf32>) -> ()

func.func @transfer_read_within_async_execute(%A : memref<?x?xf32>) -> !async.token {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32
  %token = async.execute {
    %0 = vector.transfer_read %A[%c0, %c0], %f0 : memref<?x?xf32>, vector<2x2xf32>
    func.call @fake_side_effecting_fun(%0) : (vector<2x2xf32>) -> ()
    async.yield
  }
  return %token : !async.token
}

// Ensure that `alloca`s are inserted outside of loops even though loops are
// consdered allocation scopes.
func.func @transfer_read_within_scf_for(%A : memref<?x?xf32>, %lb : index, %ub : index, %step : index) {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32
  scf.for %i = %lb to %ub step %step {
    %0 = vector.transfer_read %A[%c0, %c0], %f0 : memref<?x?xf32>, vector<2x2xf32>
    func.call @fake_side_effecting_fun(%0) : (vector<2x2xf32>) -> ()
  }
  return
}

module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%root : !transform.any_op {transform.readonly}) {
    %func_op = transform.structured.match ops{["func.func"]} in %root : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %func_op {
      transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
    } : !transform.op<"func.func">
    transform.yield
  }
}
