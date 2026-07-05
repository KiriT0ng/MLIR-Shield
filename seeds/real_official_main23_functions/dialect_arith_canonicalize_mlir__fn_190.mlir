func.func @mulsiExtendedOneRhsI1(%arg0: i1) -> (i1, i1) {
  %one = arith.constant true
  %low, %high = arith.mulsi_extended %arg0, %one: i1
  return %low, %high : i1, i1
}
