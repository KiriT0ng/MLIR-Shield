func.func @doubleAddSub2(%arg0: index, %arg1 : index) -> index {
  %sub = arith.subi %arg0, %arg1 : index
  %add = arith.addi %arg1, %sub : index
  return %add : index
}
