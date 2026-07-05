func.func @truncIShrSIToTrunciShrUI(%a: i64) -> i32 {
  %c32 = arith.constant 32: i64
  %sh = arith.shrsi %a, %c32 : i64
  %hi = arith.trunci %sh: i64 to i32
  return %hi : i32
}
