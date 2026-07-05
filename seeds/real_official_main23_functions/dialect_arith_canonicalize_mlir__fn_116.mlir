func.func @truncTrunc(%arg0: i64) -> i8 {
  %tr1 = arith.trunci %arg0 : i64 to i32
  %tr2 = arith.trunci %tr1 : i32 to i8
  return %tr2 : i8
}
