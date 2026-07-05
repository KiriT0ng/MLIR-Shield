func.func @addiMuliToSubiRhsI32(%arg0: i32, %arg1: i32) -> i32 {
  %c-1 = arith.constant -1 : i32
  %neg = arith.muli %arg1, %c-1 : i32
  %add = arith.addi %arg0, %neg : i32
  return %add : i32
}
