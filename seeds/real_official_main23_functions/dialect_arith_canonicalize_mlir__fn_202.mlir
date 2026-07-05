func.func @muluiExtendedUnusedLow(%arg0: i32) -> i32 {
  %low, %high = arith.mului_extended %arg0, %arg0: i32
  return %high : i32
}
