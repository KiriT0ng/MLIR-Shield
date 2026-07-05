func.func @tripleAddSub0Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %c17, %arg0 overflow<nsw, nuw> : index
  %add2 = arith.addi %c42, %add1 overflow<nsw, nuw> : index
  return %add2 : index
}
