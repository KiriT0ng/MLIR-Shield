func.func @nofoldShl() -> i64 {
  %c1 = arith.constant 1 : i64
  %c132 = arith.constant 132 : i64
  %r = arith.shli %c1, %c132 : i64
  return %r : i64
}
