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
