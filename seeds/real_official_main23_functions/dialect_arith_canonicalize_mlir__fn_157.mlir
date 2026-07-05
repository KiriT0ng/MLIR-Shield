func.func @addiMuliToSubiRhsIndex(%arg0: index, %arg1: index) -> index {
  %c-1 = arith.constant -1 : index
  %neg = arith.muli %arg1, %c-1 : index
  %add = arith.addi %arg0, %neg : index
  return %add : index
}
