func.func @subSub0Ovf(%arg0: index, %arg1: index) -> index {
  %sub1 = arith.subi %arg0, %arg1 overflow<nsw, nuw> : index
  %sub2 = arith.subi %sub1, %arg0 overflow<nsw, nuw> : index
  return %sub2 : index
}
