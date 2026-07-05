func.func @foldShrs() -> i64 {
  %c1 = arith.constant 8 : i64
  %c32 = arith.constant 2 : i64
  %r = arith.shrsi %c1, %c32 : i64
  return %r : i64
}
