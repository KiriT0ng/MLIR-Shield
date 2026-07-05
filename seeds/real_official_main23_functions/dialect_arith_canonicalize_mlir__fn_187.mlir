func.func @mulsiExtendedZeroLhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 0 : i32
  %low, %high = arith.mulsi_extended %zero, %arg0: i32
  return %low, %high : i32, i32
}
