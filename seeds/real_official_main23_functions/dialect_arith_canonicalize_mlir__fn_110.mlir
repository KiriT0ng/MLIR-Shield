func.func @truncExtsi(%arg0: i32) -> i32 {
  %extsi = arith.extsi %arg0 : i32 to i64
  %trunci = arith.trunci %extsi : i64 to i32
  return %trunci : i32
}
