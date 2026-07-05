func.func @nofoldShru2() -> i64 {
  %c1 = arith.constant 8 : i64
  %cm32 = arith.constant -32 : i64
  %r = arith.shrui %c1, %cm32 : i64
  return %r : i64
}
