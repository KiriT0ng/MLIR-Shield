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
