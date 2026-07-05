func.func @truncExtsi2(%arg0: i32) -> i16 {
  %extsi = arith.extsi %arg0 : i32 to i64
  %trunci = arith.trunci %extsi : i64 to i16
  return %trunci : i16
}
