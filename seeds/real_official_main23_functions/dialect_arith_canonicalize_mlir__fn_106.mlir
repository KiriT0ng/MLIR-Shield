func.func @truncExtui2(%arg0: i32) -> i16 {
  %extui = arith.extui %arg0 : i32 to i64
  %trunci = arith.trunci %extui : i64 to i16
  return %trunci : i16
}
