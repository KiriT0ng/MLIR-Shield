func.func @mulsiExtendedOneRhs(%arg0: i32) -> (i32, i32) {
  %one = arith.constant 1 : i32
  %low, %high = arith.mulsi_extended %arg0, %one: i32
  return %low, %high : i32, i32
}
