func.func @subSub1(%arg0: index, %arg1: index) -> index {
  %sub1 = arith.subi %arg0, %arg1 : index
  %sub2 = arith.subi %arg0, %sub1 : index
  return %sub2 : index
}
