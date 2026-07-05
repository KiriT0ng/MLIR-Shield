func.func @mulsiExtendedUnusedHigh(%arg0: i32) -> i32 {
  %low, %high = arith.mulsi_extended %arg0, %arg0: i32
  return %low : i32
}
