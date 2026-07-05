func.func @simple_std_for_loop(%arg0 : index, %arg1 : index, %arg2 : index) {
  scf.for %i0 = %arg0 to %arg1 step %arg2 {
    %c1 = arith.constant 1 : index
  }
  return
}

func.func @unsigned_loop(%arg0 : index, %arg1 : index, %arg2 : index) {
  scf.for unsigned %i0 = %arg0 to %arg1 step %arg2 {
    %c1 = arith.constant 1 : index
  }
  return
}

func.func @simple_std_2_for_loops(%arg0 : index, %arg1 : index, %arg2 : index) {
  scf.for %i0 = %arg0 to %arg1 step %arg2 {
    %c1 = arith.constant 1 : index
    scf.for %i1 = %arg0 to %arg1 step %arg2 {
      %c1_0 = arith.constant 1 : index
    }
  }
  return
}

func.func @simple_std_if(%arg0: i1) {
  scf.if %arg0 {
    %c1 = arith.constant 1 : index
  }
  return
}

func.func @simple_std_if_else(%arg0: i1) {
  scf.if %arg0 {
    %c1 = arith.constant 1 : index
  } else {
    %c1_0 = arith.constant 1 : index
  }
  return
}

func.func @simple_std_2_ifs(%arg0: i1) {
  scf.if %arg0 {
    %c1 = arith.constant 1 : index
    scf.if %arg0 {
      %c1_0 = arith.constant 1 : index
    } else {
      %c1_1 = arith.constant 1 : index
    }
  }
  return
}

func.func @simple_std_for_loop_with_2_ifs(%arg0 : index, %arg1 : index, %arg2 : index, %arg3 : i1) {
  scf.for %i0 = %arg0 to %arg1 step %arg2 {
    %c1 = arith.constant 1 : index
    scf.if %arg3 {
      %c1_0 = arith.constant 1 : index
      scf.if %arg3 {
        %c1_1 = arith.constant 1 : index
      } else {
        %c1_2 = arith.constant 1 : index
      }
    }
  }
  return
}

func.func @simple_if_yield(%arg0: i1) -> (i1, i1) {
  %0:2 = scf.if %arg0 -> (i1, i1) {
    %c0 = arith.constant false
    %c1 = arith.constant true
    scf.yield %c0, %c1 : i1, i1
  } else {
    %c0 = arith.constant false
    %c1 = arith.constant true
    scf.yield %c1, %c0 : i1, i1
  }
  return %0#0, %0#1 : i1, i1
}

func.func @nested_if_yield(%arg0: i1) -> (index) {
  %0 = scf.if %arg0 -> i1 {
    %1 = arith.constant true
    scf.yield %1 : i1
  } else {
    %2 = arith.constant false
    scf.yield %2 : i1
  }
  %1 = scf.if %0 -> index {
    %3 = scf.if %arg0 -> index {
      %4 = arith.constant 40 : index
      scf.yield %4 : index
    } else {
      %5 = arith.constant 41 : index
      scf.yield %5 : index
    }
    scf.yield %3 : index
  } else {
    %6 = arith.constant 42 : index
    scf.yield %6 : index
  }
  return %1 : index
}


func.func @parallel_loop(%arg0 : index, %arg1 : index, %arg2 : index,
                        %arg3 : index, %arg4 : index) {
  %step = arith.constant 1 : index
  scf.parallel (%i0, %i1) = (%arg0, %arg1) to (%arg2, %arg3)
                                          step (%arg4, %step) {
    %c1 = arith.constant 1 : index
    scf.reduce
  }
  return
}

//
//
//
func.func @for_yield(%arg0 : index, %arg1 : index, %arg2 : index) -> (f32, f32) {
  %s0 = arith.constant 0.0 : f32
  %s1 = arith.constant 1.0 : f32
  %result:2 = scf.for %i0 = %arg0 to %arg1 step %arg2 iter_args(%si = %s0, %sj = %s1) -> (f32, f32) {
    %sn = arith.addf %si, %sj : f32
    scf.yield %sn, %sn : f32, f32
  }
  return %result#0, %result#1 : f32, f32
}

func.func @nested_for_yield(%arg0 : index, %arg1 : index, %arg2 : index) -> f32 {
  %s0 = arith.constant 1.0 : f32
  %r = scf.for %i0 = %arg0 to %arg1 step %arg2 iter_args(%iter = %s0) -> (f32) {
    %result = scf.for %i1 = %arg0 to %arg1 step %arg2 iter_args(%si = %iter) -> (f32) {
      %sn = arith.addf %si, %si : f32
      scf.yield %sn : f32
    }
    scf.yield %result : f32
  }
  return %r : f32
}

func.func private @generate() -> i64

func.func @simple_parallel_reduce_loop(%arg0: index, %arg1: index,
                                  %arg2: index, %arg3: f32) -> f32 {
  // A parallel loop with reduction is converted through sequential loops with
  // reductions into a CFG of blocks where the partially reduced value is
  // passed across as a block argument.

  // Branch to the condition block passing in the initial reduction value.

  // Condition branch takes as arguments the current value of the iteration
  // variable and the current partially reduced value.

  // Bodies of scf.reduce operations are folded into the main loop body. The
  // result of this partial reduction is passed as argument to the condition
  // block.

  // The continuation block has access to the (last value of) reduction.
  %0 = scf.parallel (%i) = (%arg0) to (%arg1) step (%arg2) init(%arg3) -> f32 {
    %cst = arith.constant 42.0 : f32
    scf.reduce(%cst : f32) {
    ^bb0(%lhs: f32, %rhs: f32):
      %1 = arith.mulf %lhs, %rhs : f32
      scf.reduce.return %1 : f32
    }
  }
  return %0 : f32
}

func.func @parallel_reduce_loop(%arg0 : index, %arg1 : index, %arg2 : index,
                           %arg3 : index, %arg4 : index, %arg5 : f32) -> (f32, i64) {
  // Multiple reduction blocks should be folded in the same body, and the
  // reduction value must be forwarded through block structures.
  %step = arith.constant 1 : index
  %init = arith.constant 42 : i64
  %0:2 = scf.parallel (%i0, %i1) = (%arg0, %arg1) to (%arg2, %arg3)
                       step (%arg4, %step) init(%arg5, %init) -> (f32, i64) {
    %cf = arith.constant 42.0 : f32
    %2 = func.call @generate() : () -> i64
    scf.reduce(%cf, %2 : f32, i64) {
    ^bb0(%lhs: f32, %rhs: f32):
      %1 = arith.addf %lhs, %rhs : f32
      scf.reduce.return %1 : f32
    }, {
    ^bb0(%lhs: i64, %rhs: i64):
      %3 = arith.ori %lhs, %rhs : i64
      scf.reduce.return %3 : i64
    }
  }
  return %0#0, %0#1 : f32, i64
}

// Check that the conversion is not overly conservative wrt unknown ops, i.e.
// that the presence of unknown ops does not prevent the conversion from being
// applied.
func.func @unknown_op_inside_loop(%arg0: index, %arg1: index, %arg2: index) {
  scf.for %i = %arg0 to %arg1 step %arg2 {
    "unknown.op"() : () -> ()
    scf.yield
  }
  return
}

func.func @minimal_while() {
  %0 = "test.make_condition"() : () -> i1
  scf.while : () -> () {
    scf.condition(%0)
  } do {
    "test.some_payload"() : () -> ()
    scf.yield
  }
  return
}

func.func @do_while(%arg0: f32) {
  scf.while (%arg1 = %arg0) : (f32) -> (f32) {
    %0 = "test.make_condition"() : () -> i1
    scf.condition(%0) %arg1 : f32
  } do {
  ^bb0(%arg2: f32):
    scf.yield %arg2 : f32
  }
  return
}

func.func @while_values(%arg0: i32, %arg1: f32) {
  %0 = "test.make_condition"() : () -> i1
  %c0_i32 = arith.constant 0 : i32
  %cst = arith.constant 0.000000e+00 : f32
  %1:2 = scf.while (%arg2 = %arg0, %arg3 = %arg1) : (i32, f32) -> (i64, f64) {
    %2 = arith.extui %arg0 : i32 to i64
    %3 = arith.extf %arg3 : f32 to f64
    scf.condition(%0) %2, %3 : i64, f64
  } do {
  ^bb0(%arg2: i64, %arg3: f64):
    scf.yield %c0_i32, %cst : i32, f32
  }
  return
}

func.func @nested_while_ops(%arg0: f32) -> i64 {
  %0 = scf.while(%outer = %arg0) : (f32) -> i64 {
    %cond = "test.outer_before_pre"() : () -> i1
    %1 = scf.while(%inner = %outer) : (f32) -> i64 {
      %2:2 = "test.inner_before"(%inner) : (f32) -> (i1, i64)
      scf.condition(%2#0) %2#1 : i64
    } do {
    ^bb0(%arg1: i64):
      %3 = "test.inner_after"(%arg1) : (i64) -> f32
      scf.yield %3 : f32
    }
    "test.outer_before_post"() : () -> ()
    scf.condition(%cond) %1 : i64
  } do {
  ^bb2(%arg2: i64):
    "test.outer_after_pre"(%arg2) : (i64) -> ()
    %4 = scf.while(%inner = %arg2) : (i64) -> f32 {
      %5:2 = "test.inner2_before"(%inner) : (i64) -> (i1, f32)
      scf.condition(%5#0) %5#1 : f32
    } do {
    ^bb3(%arg3: f32):
      %6 = "test.inner2_after"(%arg3) : (f32) -> i64
      scf.yield %6 : i64
    }
    "test.outer_after_post"() : () -> ()
    scf.yield %4 : f32
  }
  return %0 : i64
}

func.func @ifs_in_parallel(%arg1: index, %arg2: index, %arg3: index, %arg4: i1, %arg5: i1) {
  scf.parallel (%i) = (%arg1) to (%arg2) step (%arg3) {
    scf.if %arg4 {
      %0 = scf.if %arg5 -> (index) {
        %1 = "test.if2"() : () -> index
        scf.yield %1 : index
      } else {
        %2 = "test.else2"() : () -> index
        scf.yield %2 : index
      }
    }
    scf.reduce
  }

  return
}

func.func @func_execute_region_elim_multi_yield() {
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


func.func @index_switch(%i: index, %a: i32, %b: i32, %c: i32) -> i32 {
  %0 = scf.index_switch %i -> i32
  case 0 {
    scf.yield %a : i32
  }
  case 1 {
    scf.yield %b : i32
  }
  default {
    scf.yield %c : i32
  }
  return %0 : i32
}

// Verify that case values larger than INT32_MAX are not truncated (issue #111589).
// In particular, case 4294967296 (2^32) must not alias with case 0 after lowering.
func.func @index_switch_large_cases(%i: index) {
  scf.index_switch %i
  case 0 {
    scf.yield
  }
  case 4294967296 { // 2^32, previously truncated to 0
    scf.yield
  }
  case 8589934592 { // 2^33
    scf.yield
  }
  default {
    scf.yield
  }
  return
}

// Note: scf.forall is lowered to scf.parallel, which is currently lowered to
// scf.for and then to unstructured control flow. scf.parallel could lower more
// efficiently to multi-threaded IR, at which point scf.forall would
// automatically lower to multi-threaded IR.

func.func @forall(%num_threads: index) {
  scf.forall (%thread_idx) in (%num_threads) {
    "test.foo"(%thread_idx) : (index) -> ()
    scf.forall.in_parallel {
    }
  }
  return
}

// -----


#no_unroll = #llvm.loop_annotation<unroll = <disable = true>>
#full_unroll = #llvm.loop_annotation<unroll = <full = true>>
func.func @simple_std_for_loops_annotation(%arg0 : index, %arg1 : index, %arg2 : index) {
  scf.for %i0 = %arg0 to %arg1 step %arg2 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.for %i1 = %c0 to %c4 step %c1 {
      %c1_0 = arith.constant 1 : index
    } {llvm.loop_annotation = #full_unroll}
  } {llvm.loop_annotation = #no_unroll}
  return
}

// -----

#no_unroll = #llvm.loop_annotation<unroll = <disable = true>>
func.func @simple_while_loops_annotation(%arg0 : i1) {
  scf.while : () -> () {
    scf.condition(%arg0)
  } do {
    scf.yield
  } attributes {llvm.loop_annotation = #no_unroll}
  return
}

// -----

#no_unroll = #llvm.loop_annotation<unroll = <disable = true>>
func.func @do_while_loops_annotation() {
  %c0_i32 = arith.constant 0 : i32
  scf.while (%arg2 = %c0_i32) : (i32) -> (i32) {
    %0 = "test.make_condition"() : () -> i1
    scf.condition(%0) %c0_i32 : i32
  } do {
 ^bb0(%arg2: i32):    
    scf.yield %c0_i32: i32
  } attributes {llvm.loop_annotation = #no_unroll}
  return
}
