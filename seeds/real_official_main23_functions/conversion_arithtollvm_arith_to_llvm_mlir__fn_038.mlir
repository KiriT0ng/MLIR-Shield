func.func @mulsi_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i32) {
  %low, %high = arith.mulsi_extended %arg0, %arg1 : i32
  return %low, %high : i32, i32
}
