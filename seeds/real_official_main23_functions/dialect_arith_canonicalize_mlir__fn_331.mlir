func.func @truncIShrSIToTrunciShrUIBadShiftAmt2(%a: i64) -> i32 {
  %c31 = arith.constant 31: i64
  %sh = arith.shrsi %a, %c31 : i64
  %hi = arith.trunci %sh: i64 to i32
  return %hi : i32
}
