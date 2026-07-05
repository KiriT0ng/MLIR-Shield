func.func @truncIShrSIToTrunciShrUIBadShiftAmt1(%a: i64) -> i32 {
  %c33 = arith.constant 33: i64
  %sh = arith.shrsi %a, %c33 : i64
  %hi = arith.trunci %sh: i64 to i32
  return %hi : i32
}
