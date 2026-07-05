func.func @foldShl() -> i64 {
  %c1 = arith.constant 1 : i64
  %c32 = arith.constant 32 : i64
  %r = arith.shli %c1, %c32 : i64
  return %r : i64
}
