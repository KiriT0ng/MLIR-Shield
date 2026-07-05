func.func @tripleMulLargeInt(%arg0: i256) -> i256 {
  %0 = arith.constant 3618502788666131213697322783095070105623107215331596699973092056135872020481 : i256
  %1 = arith.constant 1 : i256
  %2 = arith.addi %arg0, %0 : i256
  %3 = arith.addi %2, %1 : i256
  return %3 : i256
}
