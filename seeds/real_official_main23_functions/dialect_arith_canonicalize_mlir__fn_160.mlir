func.func @addiMuliToSubiLhsIndex(%arg0: index, %arg1: index) -> index {
  %c-1 = arith.constant -1 : index
  %neg = arith.muli %arg1, %c-1 : index
  %add = arith.addi %neg, %arg0 : index
  return %add : index
}
