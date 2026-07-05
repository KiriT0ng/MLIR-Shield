func.func @single_iteration_some(%A: memref<?x?x?xi32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %c6 = arith.constant 6 : index
  %c7 = arith.constant 7 : index
  %c10 = arith.constant 10 : index
  scf.parallel (%i0, %i1, %i2) = (%c0, %c3, %c7) to (%c1, %c6, %c10) step (%c1, %c2, %c3) {
    %c42 = arith.constant 42 : i32
    memref.store %c42, %A[%i0, %i1, %i2] : memref<?x?x?xi32>
    scf.reduce
  }
  return
}


// -----

func.func @single_iteration_all(%A: memref<?x?x?xi32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c3 = arith.constant 3 : index
  %c6 = arith.constant 6 : index
  %c7 = arith.constant 7 : index
  %c10 = arith.constant 10 : index
  scf.parallel (%i0, %i1, %i2) = (%c0, %c3, %c7) to (%c1, %c6, %c10) step (%c1, %c3, %c3) {
    %c42 = arith.constant 42 : i32
    memref.store %c42, %A[%i0, %i1, %i2] : memref<?x?x?xi32>
    scf.reduce
  }
  return
}


// -----

func.func @single_iteration_reduce(%A: index, %B: index) -> (index, index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %c6 = arith.constant 6 : index
  %0:2 = scf.parallel (%i0, %i1) = (%c1, %c3) to (%c2, %c6) step (%c1, %c3) init(%A, %B) -> (index, index) {
    scf.reduce(%i0, %i1 : index, index)  {
    ^bb0(%lhs: index, %rhs: index):
      %1 = arith.addi %lhs, %rhs : index
      scf.reduce.return %1 : index
    }, {
    ^bb0(%lhs: index, %rhs: index):
      %2 = arith.muli %lhs, %rhs : index
      scf.reduce.return %2 : index
    }
  }
  return %0#0, %0#1 : index, index
}


// -----

func.func @nested_parallel(%0: memref<?x?x?xf64>) -> memref<?x?x?xf64> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %1 = memref.dim %0, %c0 : memref<?x?x?xf64>
  %2 = memref.dim %0, %c1 : memref<?x?x?xf64>
  %3 = memref.dim %0, %c2 : memref<?x?x?xf64>
  %4 = memref.alloc(%1, %2, %3) : memref<?x?x?xf64>
  scf.parallel (%arg1) = (%c0) to (%1) step (%c1) {
    scf.parallel (%arg2) = (%c0) to (%2) step (%c1) {
      scf.parallel (%arg3) = (%c0) to (%3) step (%c1) {
        %5 = memref.load %0[%arg1, %arg2, %arg3] : memref<?x?x?xf64>
        memref.store %5, %4[%arg1, %arg2, %arg3] : memref<?x?x?xf64>
        scf.reduce
      }
      scf.reduce
    }
    scf.reduce
  }
  return %4 : memref<?x?x?xf64>
}


// -----

func.func private @side_effect()
func.func @one_unused(%cond: i1) -> (index) {
  %0, %1 = scf.if %cond -> (index, index) {
    func.call @side_effect() : () -> ()
    %c0 = "test.value0"() : () -> (index)
    %c1 = "test.value1"() : () -> (index)
    scf.yield %c0, %c1 : index, index
  } else {
    %c2 = "test.value2"() : () -> (index)
    %c3 = "test.value3"() : () -> (index)
    scf.yield %c2, %c3 : index, index
  }
  return %1 : index
}


// -----

func.func private @side_effect()
func.func @nested_unused(%cond1: i1, %cond2: i1) -> (index) {
  %0, %1 = scf.if %cond1 -> (index, index) {
    %2, %3 = scf.if %cond2 -> (index, index) {
      func.call @side_effect() : () -> ()
      %c0 = "test.value0"() : () -> (index)
      %c1 = "test.value1"() : () -> (index)
      scf.yield %c0, %c1 : index, index
    } else {
      %c2 = "test.value2"() : () -> (index)
      %c3 = "test.value3"() : () -> (index)
      scf.yield %c2, %c3 : index, index
    }
    scf.yield %2, %3 : index, index
  } else {
    %c0 = "test.value0_2"() : () -> (index)
    %c1 = "test.value1_2"() : () -> (index)
    scf.yield %c0, %c1 : index, index
  }
  return %1 : index
}


// -----

func.func private @side_effect()
func.func @all_unused(%cond: i1) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0, %1 = scf.if %cond -> (index, index) {
    func.call @side_effect() : () -> ()
    scf.yield %c0, %c1 : index, index
  } else {
    func.call @side_effect() : () -> ()
    scf.yield %c0, %c1 : index, index
  }
  return
}


// -----

func.func @empty_if1(%cond: i1) {
  scf.if %cond {
    scf.yield
  }
  return
}


// -----

func.func @empty_if2(%cond: i1) {
  scf.if %cond {
    scf.yield
  } else {
    scf.yield
  }
  return
}


// -----

func.func @empty_else(%cond: i1, %v : memref<i1>) {
  scf.if %cond {
    memref.store %cond, %v[] : memref<i1>
  } else {
  }
  return
}


// -----

func.func @to_select1(%cond: i1) -> index {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = scf.if %cond -> index {
    scf.yield %c0 : index
  } else {
    scf.yield %c1 : index
  }
  return %0 : index
}


// -----

func.func @to_select_same_val(%cond: i1) -> (index, index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0, %1 = scf.if %cond -> (index, index) {
    scf.yield %c0, %c1 : index, index
  } else {
    scf.yield %c1, %c1 : index, index
  }
  return %0, %1 : index, index
}


// -----

func.func @to_select_with_body(%cond: i1) -> index {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = scf.if %cond -> index {
    "test.op"() : () -> ()
    scf.yield %c0 : index
  } else {
    scf.yield %c1 : index
  }
  return %0 : index
}


// -----

func.func @to_select2(%cond: i1) -> (index, index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %0, %1 = scf.if %cond -> (index, index) {
    scf.yield %c0, %c1 : index, index
  } else {
    scf.yield %c2, %c3 : index, index
  }
  return %0, %1 : index, index
}


// -----

func.func private @make_i32() -> i32

func.func @for_yields_2(%lb : index, %ub : index, %step : index) -> i32 {
  %a = call @make_i32() : () -> (i32)
  %b = scf.for %i = %lb to %ub step %step iter_args(%0 = %a) -> i32 {
    scf.yield %0 : i32
  }
  return %b : i32
}


// -----

func.func private @make_i32() -> i32

func.func @for_yields_3(%lb : index, %ub : index, %step : index) -> (i32, i32, i32) {
  %a = call @make_i32() : () -> (i32)
  %b = call @make_i32() : () -> (i32)
  %r:3 = scf.for %i = %lb to %ub step %step iter_args(%0 = %a, %1 = %a, %2 = %b) -> (i32, i32, i32) {
    %c = func.call @make_i32() : () -> (i32)
    scf.yield %0, %c, %2 : i32, i32, i32
  } {some_attr}
  return %r#0, %r#1, %r#2 : i32, i32, i32
}


// -----

// Test that an empty loop which iterates at least once and only returns
// values defined outside of the loop is folded away.
func.func @for_yields_4() -> i32 {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %a = arith.constant 3 : i32
  %b = arith.constant 4 : i32
  %r = scf.for %i = %c0 to %c2 step %c1 iter_args(%0 = %a) -> i32 {
    scf.yield %b : i32
  }
  return %r : i32
}


// -----

func.func @constant_iter_arg(%arg0: index, %arg1: index, %arg2: index) {
  %c0_i32 = arith.constant 0 : i32
  %0 = scf.for %i = %arg0 to %arg1 step %arg2 iter_args(%arg3 = %c0_i32) -> i32 {
    "test.use"(%arg3) : (i32) -> ()
    scf.yield %c0_i32 : i32
  }
  return
}

// -----

func.func @replace_true_if() {
  %true = arith.constant true
  scf.if %true {
    "test.op"() : () -> ()
    scf.yield
  }
  return
}

// -----

func.func @remove_false_if() {
  %false = arith.constant false
  scf.if %false {
    "test.op"() : () -> ()
    scf.yield
  }
  return
}

// -----

func.func @replace_true_if_with_values() {
  %true = arith.constant true
  %0 = scf.if %true -> (i32) {
    %1 = "test.op"() : () -> i32
    scf.yield %1 : i32
  } else {
    %2 = "test.other_op"() : () -> i32
    scf.yield %2 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}

// -----

func.func @replace_false_if_with_values() {
  %false = arith.constant false
  %0 = scf.if %false -> (i32) {
    %1 = "test.op"() : () -> i32
    scf.yield %1 : i32
  } else {
    %2 = "test.other_op"() : () -> i32
    scf.yield %2 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}

// -----

func.func @merge_nested_if(%arg0: i1, %arg1: i1) {
  scf.if %arg0 {
    scf.if %arg1 {
      "test.op"() : () -> ()
      scf.yield
    }
    scf.yield
  }
  return
}

// -----

func.func @merge_yielding_nested_if(%arg0: i1, %arg1: i1) -> (i32, f32, i32, i8) {
  %0 = "test.op"() : () -> (i32)
  %1 = "test.op1"() : () -> (f32)
  %2 = "test.op2"() : () -> (i32)
  %3 = "test.op3"() : () -> (i8)
  %r:4 = scf.if %arg0 -> (i32, f32, i32, i8) {
    %a:2 = scf.if %arg1 -> (i32, f32) {
      %i = "test.inop"() : () -> (i32)
      %i1 = "test.inop1"() : () -> (f32)
      scf.yield %i, %i1 : i32, f32
    } else {
      scf.yield %2, %1 : i32, f32
    }
    scf.yield %0, %a#1, %a#0, %3 : i32, f32, i32, i8
  } else {
    scf.yield %0, %1, %2, %3 : i32, f32, i32, i8
  }
  return %r#0, %r#1, %r#2, %r#3 : i32, f32, i32, i8
}

// -----

func.func @merge_yielding_nested_if_nv1(%arg0: i1, %arg1: i1) {
  %0 = "test.op"() : () -> (i32)
  %1 = "test.op1"() : () -> (f32)
  scf.if %arg0 {
    %a:2 = scf.if %arg1 -> (i32, f32) {
      %i = "test.inop"() : () -> (i32)
      %i1 = "test.inop1"() : () -> (f32)
      scf.yield %i, %i1 : i32, f32
    } else {
      scf.yield %0, %1 : i32, f32
    }
  }
  return
}

// -----

func.func @merge_yielding_nested_if_nv2(%arg0: i1, %arg1: i1) -> i32 {
  %0 = "test.op"() : () -> (i32)
  %1 = "test.op1"() : () -> (i32)
  %r = scf.if %arg0 -> i32 {
    scf.if %arg1 {
      "test.run"() : () -> ()
    }
    scf.yield %0 : i32
  } else {
    scf.yield %1 : i32
  }
  return %r : i32
}

// -----

func.func @merge_fail_yielding_nested_if(%arg0: i1, %arg1: i1) -> (i32, f32, i32, i8) {
  %0 = "test.op"() : () -> (i32)
  %1 = "test.op1"() : () -> (f32)
  %2 = "test.op2"() : () -> (i32)
  %3 = "test.op3"() : () -> (i8)
  %r:4 = scf.if %arg0 -> (i32, f32, i32, i8) {
    %a:2 = scf.if %arg1 -> (i32, f32) {
      %i = "test.inop"() : () -> (i32)
      %i1 = "test.inop1"() : () -> (f32)
      scf.yield %i, %i1 : i32, f32
    } else {
      scf.yield %0, %1 : i32, f32
    }
    scf.yield %0, %a#1, %a#0, %3 : i32, f32, i32, i8
  } else {
    scf.yield %0, %1, %2, %3 : i32, f32, i32, i8
  }
  return %r#0, %r#1, %r#2, %r#3 : i32, f32, i32, i8
}

// -----

func.func @if_condition_swap(%cond: i1) -> index {
  %true = arith.constant true
  %not = arith.xori %cond, %true : i1
  %0 = scf.if %not -> (index) {
    %1 = "test.origTrue"() : () -> index
    scf.yield %1 : index
  } else {
    %1 = "test.origFalse"() : () -> index
    scf.yield %1 : index
  }
  return %0 : index
}

// -----

func.func @remove_zero_iteration_loop() {
  %c42 = arith.constant 42 : index
  %c1 = arith.constant 1 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %c42 to %c1 step %c1 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}

// -----

func.func @remove_while_zero_iteration_loop() -> i64 {
  %init = "test.init"() : () -> i32
  %false = arith.constant false
  %0 = scf.while (%arg0 = %init) : (i32) -> (i64) {
    %inner1 = "test.before"(%arg0) : (i32) -> i64
    scf.condition(%false) %inner1 : i64
  } do {
  ^bb0(%arg1: i64):
    %inner2 = "test.before"(%arg1) : (i64) -> i32
    scf.yield %inner2 : i32
  }
  return %0 : i64
}

// -----

func.func @remove_zero_iteration_loop_vals(%arg0: index) {
  %c2 = arith.constant 2 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %arg0 to %arg0 step %c2 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}

// -----

func.func @replace_single_iteration_loop_1() {
  %c42 = arith.constant 42 : index
  %c43 = arith.constant 43 : index
  %c1 = arith.constant 1 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %c42 to %c43 step %c1 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}

// -----

func.func @replace_single_iteration_loop_2() {
  %c5 = arith.constant 5 : index
  %c6 = arith.constant 6 : index
  %c11 = arith.constant 11 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %c5 to %c11 step %c6 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}

// -----

func.func @replace_single_iteration_loop_non_unit_step() {
  %c42 = arith.constant 42 : index
  %c47 = arith.constant 47 : index
  %c5 = arith.constant 5 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %c42 to %c47 step %c5 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}


// -----

func.func @replace_single_iteration_const_diff(%arg0 : index) {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %5 = arith.addi %arg0, %c1 overflow<nsw> : index
  scf.for %arg2 = %arg0 to %5 step %c1 {
    %7 = arith.muli %c2, %arg2 : index
    "test.consume"(%7) : (index) -> ()
  }
  return
}

// -----

func.func @replace_single_iteration_loop_unsigned_cmp() {
  %lowerBound = arith.constant 0 : i32
  %upperBound = arith.constant -100 : i32
  %step = arith.constant 2147483647 : i32
  %init = "test.init"() : () -> i32
  %0 = scf.for unsigned %i = %lowerBound to %upperBound step %step iter_args(%arg = %init) -> (i32) : i32 {
    %1 = "test.op"(%i, %arg) : (i32, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}

// -----

func.func @remove_empty_parallel_loop(%lb: index, %ub: index, %s: index) {
  %init = "test.init"() : () -> f32
  %0 = scf.parallel (%i, %j, %k) = (%lb, %ub, %lb) to (%ub, %ub, %ub) step (%s, %s, %s) init(%init) -> f32 {
    %1 = "test.produce"() : () -> f32
    scf.reduce(%1 : f32) {
    ^bb0(%lhs: f32, %rhs: f32):
      %2 = "test.transform"(%lhs, %rhs) : (f32, f32) -> f32
      scf.reduce.return %2 : f32
    }
  }
  "test.consume"(%0) : (f32) -> ()
  return
}

// -----

func.func @fold_away_iter_with_no_use_and_yielded_input(%arg0 : i32,
                    %ub : index, %lb : index, %step : index) -> (i32, i32) {
  %cst = arith.constant 32 : i32
  %0:2 = scf.for %arg1 = %lb to %ub step %step iter_args(%arg2 = %arg0, %arg3 = %cst)
    -> (i32, i32) {
    %1 = arith.addi %arg2, %cst : i32
    scf.yield %1, %cst : i32, i32
  }

  return %0#0, %0#1 : i32, i32
}

// -----

func.func @fold_away_iter_and_result_with_no_use(%arg0 : i32,
                    %ub : index, %lb : index, %step : index) -> (i32) {
  %cst = arith.constant 32 : i32
  %0:2 = scf.for %arg1 = %lb to %ub step %step iter_args(%arg2 = %arg0, %arg3 = %cst)
    -> (i32, i32) {
    %1 = arith.addi %arg2, %cst : i32
    scf.yield %1, %1 : i32, i32
  }

  return %0#0 : i32
}

// -----

func.func @replace_duplicate_iter_args(%lb: index, %ub: index, %step: index, %a: index, %b: index) -> (index, index, index, index) {
  %0:4 = scf.for %i = %lb to %ub step %step iter_args(%k0 = %a, %k1 = %b, %k2 = %b, %k3 = %a) -> (index, index, index, index) {
    %1 = arith.addi %k0, %k1 : index
    %2 = arith.addi %k2, %k3 : index
    scf.yield %1, %2, %2, %1 : index, index, index, index
  }
  return %0#0, %0#1, %0#2, %0#3 : index, index, index, index
}

// -----

func.func private @do(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32>

func.func @matmul_on_tensors(%t0: tensor<32x1024xf32>) -> tensor<?x?xf32> {
  %c0 = arith.constant 0 : index
  %c32 = arith.constant 32 : index
  %c1024 = arith.constant 1024 : index
  %0 = tensor.cast %t0 : tensor<32x1024xf32> to tensor<?x?xf32>
  %1 = scf.for %i = %c0 to %c1024 step %c32 iter_args(%iter_t0 = %0) -> (tensor<?x?xf32>) {
    %2 = func.call @do(%iter_t0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    scf.yield %2 : tensor<?x?xf32>
  } {some_attr}
  return %1 : tensor<?x?xf32>
}


// -----

func.func @cond_prop(%arg0 : i1) -> index {
  %res = scf.if %arg0 -> index {
    %res1 = scf.if %arg0 -> index {
      %v1 = "test.get_some_value1"() : () -> index
      scf.yield %v1 : index
    } else {
      %v2 = "test.get_some_value2"() : () -> index
      scf.yield %v2 : index
    }
    scf.yield %res1 : index
  } else {
    %res2 = scf.if %arg0 -> index {
      %v3 = "test.get_some_value3"() : () -> index
      scf.yield %v3 : index
    } else {
      %v4 = "test.get_some_value4"() : () -> index
      scf.yield %v4 : index
    }
    scf.yield %res2 : index
  }
  return %res : index
}

// -----

// Condition propagation: uses of the condition inside the then/else regions
// are replaced with true/false respectively (regression test for
// https://github.com/llvm/llvm-project/issues/159165).

func.func @cond_prop_then(%arg0 : i1) {
  scf.if %arg0 {
    "test.use"(%arg0) : (i1) -> ()
  }
  return
}

// -----

func.func @cond_prop_else(%arg0 : i1) {
  scf.if %arg0 {
  } else {
    "test.use"(%arg0) : (i1) -> ()
  }
  return
}

// -----

func.func @replace_if_with_cond1(%arg0 : i1) -> (i32, i1) {
  %true = arith.constant true
  %false = arith.constant false
  %res:2 = scf.if %arg0 -> (i32, i1) {
    %v = "test.get_some_value"() : () -> i32
    scf.yield %v, %true : i32, i1
  } else {
    %v2 = "test.get_some_value"() : () -> i32
    scf.yield %v2, %false : i32, i1
  }
  return %res#0, %res#1 : i32, i1
}

// -----

func.func @replace_if_with_cond2(%arg0 : i1) -> (i32, i1) {
  %true = arith.constant true
  %false = arith.constant false
  %res:2 = scf.if %arg0 -> (i32, i1) {
    %v = "test.get_some_value"() : () -> i32
    scf.yield %v, %false : i32, i1
  } else {
    %v2 = "test.get_some_value"() : () -> i32
    scf.yield %v2, %true : i32, i1
  }
  return %res#0, %res#1 : i32, i1
}

// -----

func.func @replace_if_with_cond3(%arg0 : i1, %arg2: i64) -> (i32, i64) {
  %res:2 = scf.if %arg0 -> (i32, i64) {
    %v = "test.get_some_value"() : () -> i32
    scf.yield %v, %arg2 : i32, i64
  } else {
    %v2 = "test.get_some_value"() : () -> i32
    scf.yield %v2, %arg2 : i32, i64
  }
  return %res#0, %res#1 : i32, i64
}

// -----

func.func @while_move_if_down() -> i32 {
  %defined_outside = "test.get_some_value0" () : () -> (i32)
  %0 = scf.while () : () -> (i32) {
    %used_value = "test.get_some_value1" () : () -> (i32)
    %used_by_subregion = "test.get_some_value2" () : () -> (i32)
    %else_value = "test.get_some_value3" () : () -> (i32)
    %condition = "test.condition"() : () -> i1
    %res = scf.if %condition -> (i32) {
      "test.use0" (%defined_outside) : (i32) -> ()
      "test.use1" (%used_value) : (i32) -> ()
      test.alloca_scope_region {
        "test.use2" (%used_by_subregion) : (i32) -> ()
      }
      %then_value = "test.get_some_value4" () : () -> (i32)
      scf.yield %then_value : i32
    } else {
      scf.yield %else_value : i32
    }
    scf.condition(%condition) %res : i32
  } do {
  ^bb0(%res_arg: i32):
    "test.use3" (%res_arg) : (i32) -> ()
    scf.yield
  }
  return %0 : i32
}

// -----

func.func @while_cond_true() -> i1 {
  %0 = scf.while () : () -> i1 {
    %condition = "test.condition"() : () -> i1
    scf.condition(%condition) %condition : i1
  } do {
  ^bb0(%arg0: i1):
    "test.use"(%arg0) : (i1) -> ()
    scf.yield
  }
  return %0 : i1
}

// -----

func.func @invariant_loop_args_in_same_order(%f_arg0: tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
  %cst_0 = arith.constant dense<0> : tensor<i32>
  %cst_1 = arith.constant dense<1> : tensor<i32>
  %cst_42 = arith.constant dense<42> : tensor<i32>

  %0:5 = scf.while (%arg0 = %cst_0, %arg1 = %f_arg0, %arg2 = %cst_1, %arg3 = %cst_1, %arg4 = %cst_0) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
    %1 = arith.cmpi slt, %arg0, %cst_42 : tensor<i32>
    %2 = tensor.extract %1[] : tensor<i1>
    scf.condition(%2) %arg0, %arg1, %arg2, %arg3, %arg4 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
  } do {
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<i32>, %arg4: tensor<i32>): // no predecessors
    // %arg1 here will get replaced by %cst_1
    %1 = arith.addi %arg0, %arg1 : tensor<i32>
    %2 = arith.addi %arg2, %arg3 : tensor<i32>
    scf.yield %1, %arg1, %2, %2, %arg4 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
  }
  return %0#0, %0#1, %0#2, %0#3, %0#4 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
}

func.func @while_loop_invariant_argument_different_order(%arg : tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
  %cst_0 = arith.constant dense<0> : tensor<i32>
  %cst_1 = arith.constant dense<1> : tensor<i32>
  %cst_42 = arith.constant dense<42> : tensor<i32>

  %0:6 = scf.while (%arg0 = %cst_0, %arg1 = %cst_1, %arg2 = %cst_1, %arg3 = %cst_1, %arg4 = %cst_0) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>) {
    %1 = arith.cmpi slt, %arg0, %arg : tensor<i32>
    %2 = tensor.extract %1[] : tensor<i1>
    scf.condition(%2) %arg1, %arg0, %arg2, %arg0, %arg3, %arg4 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
  } do {
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<i32>, %arg4: tensor<i32>, %arg5: tensor<i32>): // no predecessors
    %1 = arith.addi %arg0, %cst_1 : tensor<i32>
    %2 = arith.addi %arg2, %arg3 : tensor<i32>
    scf.yield %arg3, %arg1, %2, %2, %arg4 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
  }
  return %0#0, %0#1, %0#2, %0#3, %0#4, %0#5 : tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>, tensor<i32>
}

// -----

func.func @while_unused_result() -> i32 {
  %0:2 = scf.while () : () -> (i32, i64) {
    %condition = "test.condition"() : () -> i1
    %v1 = "test.get_some_value"() : () -> i32
    %v2 = "test.get_some_value"() : () -> i64
    scf.condition(%condition) %v1, %v2 : i32, i64
  } do {
  ^bb0(%arg0: i32, %arg1: i64):
    "test.use"(%arg0) : (i32) -> ()
    scf.yield
  }
  return %0#0 : i32
}

// -----

func.func @while_cmp_lhs(%arg0 : i32) {
  %0 = scf.while () : () -> i32 {
    %val = "test.val"() : () -> i32
    %condition = arith.cmpi ne, %val, %arg0 : i32
    scf.condition(%condition) %val : i32
  } do {
  ^bb0(%val2: i32):
    %condition2 = arith.cmpi ne, %val2, %arg0 : i32
    %negcondition2 = arith.cmpi eq, %val2, %arg0 : i32
    "test.use"(%condition2, %negcondition2, %val2) : (i1, i1, i32) -> ()
    scf.yield
  }
  return
}

// -----

func.func @while_cmp_rhs(%arg0 : i32) {
  %0 = scf.while () : () -> i32 {
    %val = "test.val"() : () -> i32
    %condition = arith.cmpi ne, %arg0, %val : i32
    scf.condition(%condition) %val : i32
  } do {
  ^bb0(%val2: i32):
    %condition2 = arith.cmpi ne, %arg0, %val2 : i32
    %negcondition2 = arith.cmpi eq, %arg0, %val2 : i32
    "test.use"(%condition2, %negcondition2, %val2) : (i1, i1, i32) -> ()
    scf.yield
  }
  return
}

// -----

func.func @while_duplicated_res() -> (i32, i32) {
  %0:2 = scf.while () : () -> (i32, i32) {
    %val = "test.val"() : () -> i32
    %condition = "test.condition"() : () -> i1
    scf.condition(%condition) %val, %val : i32, i32
  } do {
  ^bb0(%val2: i32, %val3: i32):
    "test.use"(%val2, %val3) : (i32, i32) -> ()
    scf.yield
  }
  return %0#0, %0#1: i32, i32
}


// -----

func.func @while_unused_arg1(%x : i32, %y : f64) -> i32 {
  %0 = scf.while (%arg1 = %x, %arg2 = %y) : (i32, f64) -> (i32) {
    %condition = "test.condition"(%arg1) : (i32) -> i1
    scf.condition(%condition) %arg1 : i32
  } do {
  ^bb0(%arg1: i32):
    %next = "test.use"(%arg1) : (i32) -> (i32)
    scf.yield %next, %y : i32, f64
  }
  return %0 : i32
}


// -----

func.func @while_unused_arg2(%val0: i32) -> i32 {
  %0 = scf.while (%val1 = %val0) : (i32) -> i32 {
    %val = "test.val"() : () -> i32
    %condition = "test.condition"() : () -> i1
    scf.condition(%condition) %val: i32
  } do {
  ^bb0(%val2: i32):
    "test.use"(%val2) : (i32) -> ()
    %val1 = "test.val1"() : () -> i32
    scf.yield %val1 : i32
  }
  return %0 : i32
}


// -----

func.func @test_align_args() -> (i64, f32, i32) {
  %0 = "test.test"() : () -> (f32)
  %1 = "test.test"() : () -> (i32)
  %2 = "test.test"() : () -> (i64)
  %3:3 = scf.while (%arg0 = %0, %arg1 = %1, %arg2 = %2) : (f32, i32, i64) -> (i64, f32, i32) {
    %cond = "test.test"() : () -> (i1)
    scf.condition(%cond) %arg2, %arg0, %arg1 : i64, f32, i32
  } do {
  ^bb0(%arg3: i64, %arg4: f32, %arg5: i32):
    %4 = "test.test"(%arg3) : (i64) -> (f32)
    %5 = "test.test"(%arg4) : (f32) -> (i32)
    %6 = "test.test"(%arg5) : (i32) -> (i64)
    scf.yield %4, %5, %6 : f32, i32, i64
  }
  return %3#0, %3#1, %3#2 : i64, f32, i32
}


// -----

func.func @combineIfs(%arg0 : i1, %arg2: i64) -> (i32, i32) {
  %res = scf.if %arg0 -> i32 {
    %v = "test.firstCodeTrue"() : () -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.firstCodeFalse"() : () -> i32
    scf.yield %v2 : i32
  }
  %res2 = scf.if %arg0 -> i32 {
    %v = "test.secondCodeTrue"() : () -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.secondCodeFalse"() : () -> i32
    scf.yield %v2 : i32
  }
  return %res, %res2 : i32, i32
}

// -----

func.func @combineIfs2(%arg0 : i1, %arg2: i64) -> i32 {
  scf.if %arg0 {
    "test.firstCodeTrue"() : () -> ()
    scf.yield
  }
  %res = scf.if %arg0 -> i32 {
    %v = "test.secondCodeTrue"() : () -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.secondCodeFalse"() : () -> i32
    scf.yield %v2 : i32
  }
  return %res : i32
}

// -----

func.func @combineIfs3(%arg0 : i1, %arg2: i64) -> i32 {
  %res = scf.if %arg0 -> i32 {
    %v = "test.firstCodeTrue"() : () -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.firstCodeFalse"() : () -> i32
    scf.yield %v2 : i32
  }
  scf.if %arg0 {
    "test.secondCodeTrue"() : () -> ()
    scf.yield
  }
  return %res : i32
}

// -----

func.func @combineIfs4(%arg0 : i1, %arg2: i64) {
  scf.if %arg0 {
    "test.firstCodeTrue"() : () -> ()
    scf.yield
  }
  scf.if %arg0 {
    "test.secondCodeTrue"() : () -> ()
    scf.yield
  }
  return
}


// -----

func.func @combineIfsUsed(%arg0 : i1, %arg2: i64) -> (i32, i32) {
  %res = scf.if %arg0 -> i32 {
    %v = "test.firstCodeTrue"() : () -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.firstCodeFalse"() : () -> i32
    scf.yield %v2 : i32
  }
  %res2 = scf.if %arg0 -> i32 {
    %v = "test.secondCodeTrue"(%res) : (i32) -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.secondCodeFalse"(%res) : (i32) -> i32
    scf.yield %v2 : i32
  }
  return %res, %res2 : i32, i32
}

// -----

func.func @combineIfsNot(%arg0 : i1, %arg2: i64) {
  %true = arith.constant true
  %not = arith.xori %arg0, %true : i1
  scf.if %arg0 {
    "test.firstCodeTrue"() : () -> ()
    scf.yield
  }
  scf.if %not {
    "test.secondCodeTrue"() : () -> ()
    scf.yield
  }
  return
}


// -----

func.func @combineIfsNot2(%arg0 : i1, %arg2: i64) {
  %true = arith.constant true
  %not = arith.xori %arg0, %true : i1
  scf.if %not {
    "test.firstCodeTrue"() : () -> ()
    scf.yield
  }
  scf.if %arg0 {
    "test.secondCodeTrue"() : () -> ()
    scf.yield
  }
  return
}


// -----

func.func @propagate_into_execute_region() {
  %cond = arith.constant 0 : i1
  affine.for %i = 0 to 100 {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 {
      cf.cond_br %cond, ^bb1, ^bb2

    ^bb1:
      %c1 = arith.constant 1 : i64
      cf.br ^bb3(%c1 : i64)

    ^bb2:
      %c2 = arith.constant 2 : i64
      cf.br ^bb3(%c2 : i64)

    ^bb3(%x : i64):
      scf.yield %x : i64
    }
    "test.bar"(%v) : (i64) -> ()
  }
  return
}

// -----

func.func @execute_region_inline() {
  affine.for %i = 0 to 100 {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 {
      %x = "test.val"() : () -> i64
      scf.yield %x : i64
    }
    "test.bar"(%v) : (i64) -> ()
  }
  return
}


// -----

func.func @execute_region_no_inline() {
  affine.for %i = 0 to 100 {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 no_inline {
      %x = "test.val"() : () -> i64
      scf.yield %x : i64
    }
    "test.bar"(%v) : (i64) -> ()
  }
  return
}


// -----

func.func @execute_region_under_func_no_inline() {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 no_inline {
      %x = "test.val"() : () -> i64
      scf.yield %x : i64
    }
    "test.bar"(%v) : (i64) -> ()
  return
}


// -----

func.func @func_execute_region_inline() {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 {
      %c = "test.cmp"() : () -> i1
      cf.cond_br %c, ^bb2, ^bb3
    ^bb2:
      %x = "test.val1"() : () -> i64
      cf.br ^bb4(%x : i64)
    ^bb3:
      %y = "test.val2"() : () -> i64
      cf.br ^bb4(%y : i64)
    ^bb4(%z : i64):
      scf.yield %z : i64
    }
    "test.bar"(%v) : (i64) -> ()
  return
}


// -----

func.func @func_execute_region_inline_multi_yield() {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 {
      %c = "test.cmp"() : () -> i1
      cf.cond_br %c, ^bb2, ^bb3
    ^bb2:
      %x = "test.val1"() : () -> i64
      scf.yield %x : i64
    ^bb3:
      %y = "test.val2"() : () -> i64
      scf.yield %y : i64
    }
    "test.bar"(%v) : (i64) -> ()
  return
}


// -----

// Test case with single scf.yield op inside execute_region and its operand is defined outside the execute_region op.
// Make scf.execute_region not to return anything.


module {
func.func private @foo()->()
func.func private @execute_region_yeilding_external_value() -> memref<1x60xui8> {
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>  
  %1 = scf.execute_region -> memref<1x60xui8> no_inline {    
    func.call @foo():()->()
    scf.yield %alloc: memref<1x60xui8>
  }  
  return %1 : memref<1x60xui8>
}
}

// -----

// Test case with scf.yield op inside execute_region with multiple operands.
// One of operands is defined outside the execute_region op.
// Remove just this operand from the op results.

module {
func.func private @foo()->()
func.func private @execute_region_yeilding_external_and_local_values() -> (memref<1x60xui8>, memref<1x120xui8>) {
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>  
  %1, %2 = scf.execute_region -> (memref<1x60xui8>, memref<1x120xui8>) no_inline {    
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>
    func.call @foo():()->()
    scf.yield %alloc, %alloc_1: memref<1x60xui8>,  memref<1x120xui8>
  }  
  return %1, %2 : memref<1x60xui8>, memref<1x120xui8>
}
}

// -----

// Test case with multiple scf.yield ops inside execute_region with same operands and those operands are defined outside the execute_region op..
// Make scf.execute_region not to return anything.
// scf.yield must remain, cause scf.execute_region can't be empty.


module {
  func.func private @foo()->()
  func.func private @execute_region_multiple_yields_same_operands() -> (memref<1x60xui8>, memref<1x120xui8>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>  
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>  
    %1, %2 = scf.execute_region -> (memref<1x60xui8>, memref<1x120xui8>) no_inline {
      %c = "test.cmp"() : () -> i1
      cf.cond_br %c, ^bb2, ^bb3
    ^bb2:    
      func.call @foo():()->()
      scf.yield %alloc, %alloc_1 : memref<1x60xui8>, memref<1x120xui8>
    ^bb3: 
      func.call @foo():()->()   
      scf.yield %alloc, %alloc_1 : memref<1x60xui8>, memref<1x120xui8>
    }  
    return %1, %2 : memref<1x60xui8>, memref<1x120xui8>
  }
}

// -----

// Test case with multiple scf.yield ops with at least one different operand, then no change.


module {
  func.func private @foo()->()
  func.func private @execute_region_multiple_yields_different_operands() -> (memref<1x60xui8>, memref<1x120xui8>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>  
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>  
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<1x120xui8>  
    %1, %2 = scf.execute_region -> (memref<1x60xui8>, memref<1x120xui8>) no_inline {
      %c = "test.cmp"() : () -> i1
      cf.cond_br %c, ^bb2, ^bb3
    ^bb2:    
      func.call @foo():()->()
      scf.yield %alloc, %alloc_1 : memref<1x60xui8>, memref<1x120xui8>
    ^bb3: 
      func.call @foo():()->()   
      scf.yield %alloc, %alloc_2 : memref<1x60xui8>, memref<1x120xui8>
    }  
    return %1, %2 : memref<1x60xui8>, memref<1x120xui8>
  }
}

// -----

// Test case with multiple scf.yield ops each has different operand.
// In this case scf.execute_region isn't changed.


module {
func.func private @foo()->()
func.func private @execute_region_multiple_yields_different_operands() -> (memref<1x60xui8>) {
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>  
  %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x60xui8>   
  %1 = scf.execute_region -> (memref<1x60xui8>) no_inline {
    %c = "test.cmp"() : () -> i1
    cf.cond_br %c, ^bb2, ^bb3
  ^bb2:    
    func.call @foo():()->()
    scf.yield %alloc : memref<1x60xui8>
  ^bb3:    
    func.call @foo():()->()
    scf.yield %alloc_1 : memref<1x60xui8>
  }    
  return %1 : memref<1x60xui8>
}
}

// -----

func.func @canonicalize_parallel_insert_slice_indices(
    %arg0 : tensor<1x5xf32>, %arg1: tensor<?x?xf32>, %num_threads : index) -> index
{
  %c1 = arith.constant 1 : index

  %2 = scf.forall (%tidx) in (%num_threads) shared_outs(%o = %arg1) -> (tensor<?x?xf32>) {
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %arg0 into %o[%tidx, 0] [1, 5] [1, 1] : tensor<1x5xf32> into tensor<?x?xf32>
    }
  }

  %dim = tensor.dim %2, %c1 : tensor<?x?xf32>
  return %dim : index
}

// -----

func.func @forall_fold_control_operands(
    %arg0 : tensor<?x10xf32>, %arg1: tensor<?x10xf32>) -> tensor<?x10xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %dim0 = tensor.dim %arg0, %c0 : tensor<?x10xf32>
  %dim1 = tensor.dim %arg0, %c1 : tensor<?x10xf32>

  %result = scf.forall (%i, %j) = (%c0, %c0) to (%dim0, %dim1)
      step (%c1, %c1) shared_outs(%o = %arg1) -> (tensor<?x10xf32>) {
    %slice = tensor.extract_slice %arg1[%i, %j] [1, 1] [1, 1]
      : tensor<?x10xf32> to tensor<1x1xf32>

    scf.forall.in_parallel {
      tensor.parallel_insert_slice %slice into %o[%i, %j] [1, 1] [1, 1]
        : tensor<1x1xf32> into tensor<?x10xf32>
    }
  }

  return %result : tensor<?x10xf32>
}

// -----

func.func @inline_forall_loop(%in: tensor<8x8xf32>) -> tensor<8x8xf32> {
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x8xf32>
  %1 = scf.forall (%i, %j) = (%c0, %c0) to (%c1, %c1)
        step (%c8, %c8) shared_outs (%out_ = %0) -> (tensor<8x8xf32>) {
    %slice = tensor.extract_slice %out_[%i, %j] [2, 3] [1, 1]
      : tensor<8x8xf32> to tensor<2x3xf32>
    %fill = linalg.fill ins(%cst : f32) outs(%slice : tensor<2x3xf32>)
          -> tensor<2x3xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %fill into %out_[%i, %j] [2, 3] [1, 1]
        : tensor<2x3xf32> into tensor<8x8xf32>
    }
  }
  return %1 : tensor<8x8xf32>
}




// -----

func.func @do_not_inline_distributed_forall_loop(
    %in: tensor<8x8xf32>) -> tensor<8x8xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x8xf32>
  %1 = scf.forall (%i, %j) = (0, 4) to (1, 5) step (8, 8)
      shared_outs (%out_ = %0) -> (tensor<8x8xf32>) {
    %slice = tensor.extract_slice %out_[%i, %j] [2, 3] [1, 1]
      : tensor<8x8xf32> to tensor<2x3xf32>
    %fill = linalg.fill ins(%cst : f32) outs(%slice : tensor<2x3xf32>)
          -> tensor<2x3xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %fill into %out_[%i, %j] [2, 3] [1, 1]
        : tensor<2x3xf32> into tensor<8x8xf32>
    }
  }{ mapping = [#gpu.thread<y>, #gpu.thread<x>] }
  return %1 : tensor<8x8xf32>
}

// -----

func.func @inline_empty_loop_with_empty_mapping(
    %in: tensor<16xf32>) -> tensor<16xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<16xf32>
  %1 = scf.forall () in () shared_outs (%out_ = %0) -> (tensor<16xf32>) {
    %slice = tensor.extract_slice %out_[0] [16] [1]
      : tensor<16xf32> to tensor<16xf32>
    %generic = linalg.generic {
        indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>],
        iterator_types = ["parallel"]}
        ins(%slice : tensor<16xf32>) outs(%0 : tensor<16xf32>) {
      ^bb0(%b0 : f32, %b1 : f32):
        %2 = arith.addf %b0, %b0 : f32
        linalg.yield %2 : f32
    } -> tensor<16xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %generic into %out_[0] [16] [1]
        : tensor<16xf32> into tensor<16xf32>
    }
  }{ mapping = [] }
  return %1 : tensor<16xf32>
}

// -----

func.func @collapse_one_dim_parallel(%in: tensor<8x8xf32>) -> tensor<8x8xf32> {
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x8xf32>
  %1 = scf.forall (%i, %j) = (0, %c0) to (1, %c16)
        step (8, %c8) shared_outs (%out_ = %0) -> (tensor<8x8xf32>) {
    %fill = linalg.fill ins(%cst : f32) outs(%out_ : tensor<8x8xf32>)
          -> tensor<8x8xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %fill into %out_[%i, %j] [8, 8] [1, 1]
        : tensor<8x8xf32> into tensor<8x8xf32>
    }
  }
  return %1 : tensor<8x8xf32>
}

// -----

func.func @remove_empty_forall(%in: tensor<8x8xf32>) -> tensor<8x8xf32> {
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x8xf32>
  %1 = scf.forall (%i, %j) = (%c0, %c16) to (%c1, %c16)
        step (%c8, %c8) shared_outs (%out_ = %0) -> (tensor<8x8xf32>) {
    %fill = linalg.fill ins(%cst : f32) outs(%out_ : tensor<8x8xf32>)
          -> tensor<8x8xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %fill into %out_[%i, %j] [8, 8] [1, 1]
        : tensor<8x8xf32> into tensor<8x8xf32>
    }
  }
  return %1 : tensor<8x8xf32>
}

// -----

func.func @fold_tensor_cast_into_forall(
    %in: tensor<2xi32>, %out: tensor<2xi32>) -> tensor<2xi32> {
  %cst = arith.constant dense<[100500]> : tensor<1xi32>


  %out_cast = tensor.cast %out : tensor<2xi32> to tensor<?xi32>
  %result = scf.forall (%i) = (0) to (2) step (1)
      shared_outs (%out_ = %out_cast) -> tensor<?xi32> {

    scf.forall.in_parallel {
      tensor.parallel_insert_slice %cst into %out_[%i] [1] [1]
        : tensor<1xi32> into tensor<?xi32>
    }
  }
  %result_cast = tensor.cast %result : tensor<?xi32> to tensor<2xi32>
  func.return %result_cast : tensor<2xi32>
}

// -----

func.func @do_not_fold_tensor_cast_from_dynamic_to_static_type_into_forall(
    %in: tensor<?xi32>, %out: tensor<?xi32>) -> tensor<?xi32> {
  %cst = arith.constant dense<[100500]> : tensor<1xi32>


  %out_cast = tensor.cast %out : tensor<?xi32> to tensor<2xi32>
  %result = scf.forall (%i) = (0) to (2) step (1)
      shared_outs (%out_ = %out_cast) -> tensor<2xi32> {

    scf.forall.in_parallel {
      tensor.parallel_insert_slice %cst into %out_[%i] [1] [1]
        : tensor<1xi32> into tensor<2xi32>
    }
  }
  %result_cast = tensor.cast %result : tensor<2xi32> to tensor<?xi32>
  func.return %result_cast : tensor<?xi32>
}

// -----

#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fold_iter_args_not_being_modified_within_scfforall(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 4.200000e+01 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2:2 = scf.forall (%arg3) in (%1) shared_outs(%arg4 = %arg1, %arg5 = %arg2) -> (tensor<?xf32>, tensor<?xf32>) {
      %3 = affine.apply #map1(%arg3)[%arg0]
      %4 = affine.min #map2(%arg3)[%dim, %arg0]
      %extracted_slice0 = tensor.extract_slice %arg4[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice1 = tensor.extract_slice %arg5[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice0 : tensor<?xf32>) outs(%extracted_slice1 : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg5[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2#0, %2#1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----

#map = affine_map<()[s0, s1] -> (s0 ceildiv s1)>
#map1 = affine_map<(d0)[s0] -> (d0 * s0)>
#map2 = affine_map<(d0)[s0, s1] -> (-(d0 * s1) + s0, s1)>
module {
  func.func @fold_iter_args_with_no_use_of_result_scfforall(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2:3 = scf.forall (%arg4) in (%1) shared_outs(%arg5 = %arg1, %arg6 = %arg2, %arg7 = %arg3) -> (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) {
      %3 = affine.apply #map1(%arg4)[%arg0]
      %4 = affine.min #map2(%arg4)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg5[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg6[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_1 = tensor.extract_slice %arg7[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_2 = tensor.extract_slice %0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice : tensor<?xf32>) outs(%extracted_slice_1 : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg6[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %extracted_slice into %arg5[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %extracted_slice_0 into %arg7[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %5 into %arg7[%4] [%3] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2#1 : tensor<?xf32>
  }
}

// -----

func.func @index_switch_fold() -> (f32, f32) {
  %switch_cst = arith.constant 1: index
  %0 = scf.index_switch %switch_cst -> f32
  case 1 {
    %y = arith.constant 1.0 : f32
    scf.yield %y : f32
  }
  default {
    %y = arith.constant 42.0 : f32
    scf.yield %y : f32
  }

  %switch_cst_2 = arith.constant 2: index
  %1 = scf.index_switch %switch_cst_2 -> f32
  case 0 {
    %y = arith.constant 0.0 : f32
    scf.yield %y : f32
  }
  default {
    %y = arith.constant 42.0 : f32
    scf.yield %y : f32
  }

  return %0, %1 : f32, f32
}


// -----

func.func @index_switch_fold_no_res() {
  %c1 = arith.constant 1 : index
  scf.index_switch %c1
  case 0 {
    scf.yield
  }
  default {
    "test.op"() : () -> ()
    scf.yield
  }
  return
}


// -----

// Step size 0: The loop has an infinite number of iterations.
func.func @scf_for_all_step_size_0()  {
  %x = arith.constant 0 : index
  scf.forall (%i, %j) = (0, 4) to (1, 5) step (%x, 8) {
    vector.print %i : index
    scf.forall.in_parallel {}
  }
  return
}

// -----

func.func @dead_index_switch_result(%arg0 : index, %arg1 : memref<i32>) -> index {
  %non_live, %live = scf.index_switch %arg0 -> i32, index
  case 1 {
    %c10 = arith.constant 10 : i32
    memref.store %c10, %arg1[] : memref<i32>
    scf.yield %c10, %arg0 : i32, index
  }
  default {
    %c11 = arith.constant 11 : i32
    memref.store %c11, %arg1[] : memref<i32>
    scf.yield %c11, %arg0 : i32, index
  }
  return %live : index
}

// -----

func.func private @side_effect()

func.func @iter_args_cycles(%lb : index, %ub : index, %step : index, %a : i32, %b : i64, %c : f32) -> (i32, i64, i32, i64, i64, f32) {
  %res:6 = scf.for %i = %lb to %ub step %step iter_args(%0 = %a, %1 = %b, %2 = %a, %3 = %b, %4 = %b, %5 = %c) -> (i32, i64, i32, i64, i64, f32) {
    func.call @side_effect() : () -> ()
    scf.yield %2, %4, %0, %1, %3, %5 : i32, i64, i32, i64, i64, f32
  }
  return %res#0, %res#1, %res#2, %res#3, %res#4, %res#5 : i32, i64, i32, i64, i64, f32
}

// -----

func.func private @side_effect(i32)

func.func @iter_args_cycles_non_cycle_start(%lb : index, %ub : index, %step : index, %a : i32, %b : i32) -> (i32, i32, i32) {
  %res:3 = scf.for %i = %lb to %ub step %step iter_args(%0 = %a, %1 = %b, %2 = %b) -> (i32, i32, i32) {
    func.call @side_effect(%0) : (i32) -> ()
    scf.yield %1, %2, %1 : i32, i32, i32
  }
  return %res#0, %res#1, %res#2 : i32, i32, i32
}

// -----

// Test that FoldTensorCastOfOutputIntoForallOp correctly handles the case
// where parallel_insert_slice ops write to shared outputs in a non-sequential
// order. The fix ensures that each yielding op's destination is matched to the
// correct regionIterArg based on what it actually writes to, not positionally.
func.func @fold_tensor_cast_into_forall_non_sequential_writes(
    %arg0: tensor<8x32xf32>, %arg1: tensor<8x32xf32>) -> (tensor<?x32xf32>, tensor<?x32xf32>) {
  %c8 = arith.constant 8 : index
  %c32 = arith.constant 32 : index
  %init = tensor.empty(%c32) : tensor<?x32xf32>
  %0:2 = scf.forall (%tidx) in (4) shared_outs(%arg2 = %init, %arg3 = %init)
      -> (tensor<?x32xf32>, tensor<?x32xf32>) {
    %pos = arith.muli %c8, %tidx : index
    scf.forall.in_parallel {
      // Write %arg0 to %arg3 (second shared output).
      tensor.parallel_insert_slice %arg0 into %arg3[%pos, 0] [8, 32] [1, 1]
          : tensor<8x32xf32> into tensor<?x32xf32>
      // Write %arg1 to %arg2 (first shared output).
      tensor.parallel_insert_slice %arg1 into %arg2[%pos, 0] [8, 32] [1, 1]
          : tensor<8x32xf32> into tensor<?x32xf32>
    }
  }
  // %0#0 contains %arg1 data; %0#1 contains %arg0 data.
  return %0#0, %0#1 : tensor<?x32xf32>, tensor<?x32xf32>
}
