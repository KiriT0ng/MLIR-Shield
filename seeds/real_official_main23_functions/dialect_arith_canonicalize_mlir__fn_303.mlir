func.func @nofoldShrs2() -> i64 {
  %c1 = arith.constant 8 : i64
  %cm32 = arith.constant -32 : i64
  %r = arith.shrsi %c1, %cm32 : i64
  return %r : i64
}
