func.func @subAdd1(%arg0: index, %arg1 : index) -> index {
  %add = arith.addi %arg0, %arg1 : index
  %sub = arith.subi %add, %arg1 : index
  return %sub : index
}
