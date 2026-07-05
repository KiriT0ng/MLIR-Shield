func.func @simple_std_if(%arg0: i1) {
  scf.if %arg0 {
    %c1 = arith.constant 1 : index
  }
  return
}
