func.func @adduiExtendedConstants() -> (i32, i1) {
  %c13 = arith.constant 13 : i32
  %c37 = arith.constant 37 : i32
  %sum, %overflow = arith.addui_extended %c13, %c37: i32, i1
  return %sum, %overflow : i32, i1
}
