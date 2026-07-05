func.func @tripleSubSub3Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %arg0, %c17 overflow<nsw, nuw> : index
  %add2 = arith.subi %add1, %c42 overflow<nsw, nuw> : index
  return %add2 : index
}
