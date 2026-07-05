func.func @nofoldShrs3() -> i64 {
  %c1 = arith.constant 8 : i64
  %c64 = arith.constant 64 : i64
  // Note that this should return Poison in the future.
  %r = arith.shrsi %c1, %c64 : i64
  return %r : i64
}
