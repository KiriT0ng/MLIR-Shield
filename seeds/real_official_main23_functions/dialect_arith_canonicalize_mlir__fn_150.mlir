func.func @doubleAddSub1(%arg0: index, %arg1 : index) -> index {
  %sub = arith.subi %arg0, %arg1 : index
  %add = arith.addi %sub, %arg1 : index
  return %add : index
}
