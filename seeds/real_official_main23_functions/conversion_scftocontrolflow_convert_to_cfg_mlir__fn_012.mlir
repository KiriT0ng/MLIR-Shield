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
