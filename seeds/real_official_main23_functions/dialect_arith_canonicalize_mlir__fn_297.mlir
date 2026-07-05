func.func @nofoldShru() -> i64 {
  %c1 = arith.constant 8 : i64
  %c132 = arith.constant 132 : i64
  %r = arith.shrui %c1, %c132 : i64
  return %r : i64
}
