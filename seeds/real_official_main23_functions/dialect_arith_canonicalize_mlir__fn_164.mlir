func.func @adduiExtendedZeroLhs(%arg0: i32) -> (i32, i1) {
  %zero = arith.constant 0 : i32
  %sum, %overflow = arith.addui_extended %zero, %arg0: i32, i1
  return %sum, %overflow : i32, i1
}
