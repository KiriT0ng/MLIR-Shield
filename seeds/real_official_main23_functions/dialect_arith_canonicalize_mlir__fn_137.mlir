func.func @subSub0(%arg0: index, %arg1: index) -> index {
  %sub1 = arith.subi %arg0, %arg1 : index
  %sub2 = arith.subi %sub1, %arg0 : index
  return %sub2 : index
}
