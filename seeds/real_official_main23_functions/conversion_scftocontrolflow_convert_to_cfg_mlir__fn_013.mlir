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
