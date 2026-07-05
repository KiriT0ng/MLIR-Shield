func.func @muluiExtendedZeroRhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 0 : i32
  %low, %high = arith.mului_extended %arg0, %zero: i32
  return %low, %high : i32, i32
}
