func.func @truncExtui(%arg0: i32) -> i32 {
  %extui = arith.extui %arg0 : i32 to i64
  %trunci = arith.trunci %extui : i64 to i32
  return %trunci : i32
}
