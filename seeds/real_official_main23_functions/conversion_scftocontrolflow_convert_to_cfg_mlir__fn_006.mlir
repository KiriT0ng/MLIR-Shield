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
