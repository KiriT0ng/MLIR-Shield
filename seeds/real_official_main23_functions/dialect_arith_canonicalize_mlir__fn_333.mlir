func.func @foldShrui0(%x : i64) -> i64 {
  %c0 = arith.constant 0 : i64
  %r = arith.shrui %x, %c0 : i64
  return %r : i64
}
