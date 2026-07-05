func.func @nofoldShl3() -> i64 {
  %c1 = arith.constant 1 : i64
  %c64 = arith.constant 64 : i64
  // Note that this should return Poison in the future.
  %r = arith.shli %c1, %c64 : i64
  return %r : i64
}
