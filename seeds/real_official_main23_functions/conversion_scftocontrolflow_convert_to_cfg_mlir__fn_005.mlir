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
