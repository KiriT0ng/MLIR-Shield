func.func @simple_std_if_else(%arg0: i1) {
  scf.if %arg0 {
    %c1 = arith.constant 1 : index
  } else {
    %c1_0 = arith.constant 1 : index
  }
  return
}
