func.func @unknown_op_aliasing(%f: f32, %f2: f32, %pos: index) -> f32 {

  %0 = tensor.empty() : tensor<10xf32>
  %1 = linalg.fill ins(%f : f32) outs(%0 : tensor<10xf32>) -> tensor<10xf32>

  // Something must bufferize out-of-place because the op may return an alias
  // of %1.
  %alias = "dummy.dummy_op"(%1) : (tensor<10xf32>) -> (tensor<10xf32>)

  %2 = linalg.fill ins(%f2 : f32) outs(%1 : tensor<10xf32>) -> tensor<10xf32>
  %3 = tensor.extract %alias[%pos] : tensor<10xf32>
  return %3 : f32
}

// -----

func.func @unknown_op_bbarg_aliasing() {
  %0 = tensor.empty() : tensor<7xf32>

  // %arg0 is not aliasing with %0 because it bufferizes out-of-place.
  "dummy.dummy_op"(%0) ({
  ^bb0(%arg1: tensor<7xf32>):
  }) : (tensor<7xf32>) -> ()
  return
}

// -----

func.func @unknown_op_writing(%f: f32, %f2: f32, %pos: index) -> f32 {
  %0 = tensor.empty() : tensor<10xf32>
  %1 = linalg.fill ins(%f : f32) outs(%0 : tensor<10xf32>) -> tensor<10xf32>

  // The op may bufferize to a memory write, so it must bufferize out-of-place.
  "dummy.dummy_op"(%1) : (tensor<10xf32>) -> ()

  %3 = tensor.extract %1[%pos] : tensor<10xf32>
  return %3 : f32
}

// -----

func.func @read_of_undef_is_not_a_conflict(%f: f32, %idx: index) -> f32 {
  %0 = tensor.empty() : tensor<10xf32>
  // This can be in-place because the read below does reads undefined data.
  %1 = tensor.insert %f into %0[%idx] : tensor<10xf32>
  %2 = tensor.extract %0[%idx] : tensor<10xf32>
  return %2 : f32
}

// -----

func.func @read_of_alloc_tensor_is_not_a_conflict(%f: f32, %idx: index) -> f32 {
  %0 = bufferization.alloc_tensor() : tensor<10xf32>
  // This can be in-place because the read below does reads undefined data.
  %1 = tensor.insert %f into %0[%idx] : tensor<10xf32>
  %2 = tensor.extract %0[%idx] : tensor<10xf32>
  return %2 : f32
}

// -----

func.func @to_buffer_not_read_only(%idx : index, %f: f32) -> f32 {
  %t = tensor.generate {
  ^bb0(%i : index):
    tensor.yield %f : f32
  } : tensor<5xf32>
  // Some op may write into the result of to_buffer later.
  %m = bufferization.to_buffer %t : tensor<5xf32> to memref<5xf32>
  %2 = tensor.extract %t[%idx] : tensor<5xf32>
  return %2 : f32
}

// -----

func.func @to_buffer_read_only(%idx : index, %f: f32) -> f32 {
  %t = tensor.generate {
  ^bb0(%i : index):
    tensor.yield %f : f32
  } : tensor<5xf32>
  // Some op may write into the result of to_buffer later.
  %m = bufferization.to_buffer %t {read_only} : tensor<5xf32> to memref<5xf32>
  %2 = tensor.extract %t[%idx] : tensor<5xf32>
  return %2 : f32
}

// -----

func.func @bbarg_of_unknown_op(%f: f32) {
  %0 = tensor.empty() : tensor<10xf32>
  %1 = linalg.fill ins(%f : f32) outs(%0 : tensor<10xf32>) -> tensor<10xf32>

  // The op is not bufferizable because %1 is assumed to alias with %arg1.
  // BlockArguments are considered "not writable" by default. So %1 is also
  // considered "not writable".

  "dummy.dummy_op"(%1) ({
  ^bb0(%arg1: tensor<10xf32>):
  }) : (tensor<10xf32>) -> ()
  return
}

// -----

func.func @bbarg_of_unknown_op_2(%f: f32) {
  %0 = tensor.empty() : tensor<10xf32>
  %1 = linalg.fill ins(%f : f32) outs(%0 : tensor<10xf32>) -> tensor<10xf32>

  // The op is not bufferizable because %1 is assumed to alias with %arg1.
  // BlockArguments are considered "not writable" by default. So %1 is also
  // considered "not writable".

  "dummy.dummy_op"(%1) ({
  ^bb0(%arg1: tensor<10xf32>):
    "dummy.another_op"(%arg1) : (tensor<10xf32>) -> ()
  }) : (tensor<10xf32>) -> ()
  return
}

// -----

func.func @materialize_in_destination_aliasing(%t: tensor<?xf32>, %p1: index, %p2: index, %sz: index) -> tensor<5xf32> {
  %buffer = tensor.empty(%sz) : tensor<?xf32>
  %src = tensor.extract_slice %t[%p1][5][1] : tensor<?xf32> to tensor<5xf32>
  %dest = tensor.extract_slice %t[%p2][5][1] : tensor<?xf32> to tensor<5xf32>
  %r = bufferization.materialize_in_destination %src in %dest : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
  return %r : tensor<5xf32>
}

// -----

func.func @materialize_in_destination(%t: tensor<?xf32>, %sz: index) -> tensor<?xf32> {
  %buffer = tensor.empty(%sz) : tensor<?xf32>
  %r = bufferization.materialize_in_destination %buffer in %buffer : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
  return %r : tensor<?xf32>
}

// -----

// Regression test for https://github.com/llvm/llvm-project/issues/128316.
// When an op has a user-provided __inplace_operands_attr__ with fewer entries
// than the op's operand count, setInPlaceOpOperand must not crash.

func.func @shorter_inplace_attr(%arg0: tensor<4xi32>) -> (tensor<4xi32>, tensor<4xi32>) {
  // The __inplace_operands_attr__ has only one entry but the return has two
  // tensor operands.  The analysis must expand the annotation without crashing.
  return {__inplace_operands_attr__ = ["false"]} %arg0, %arg0 : tensor<4xi32>, tensor<4xi32>
}
