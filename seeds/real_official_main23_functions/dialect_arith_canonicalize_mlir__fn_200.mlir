func.func @muluiExtendedOneLhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 1 : i32
  %low, %high = arith.mului_extended %zero, %arg0: i32
  return %low, %high : i32, i32
}
