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
