func.func @mului_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i32) {
  %low, %high = arith.mului_extended %arg0, %arg1 : i32
  return %low, %high : i32, i32
}
