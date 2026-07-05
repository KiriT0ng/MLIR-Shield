func.func @tripleMulIMulIIndex(%arg0: index) -> index {
  %c3 = arith.constant 3 : index
  %c5 = arith.constant 5 : index
  %mul1 = arith.muli %arg0, %c3 : index
  %mul2 = arith.muli %mul1, %c5 : index
  return %mul2 : index
}
