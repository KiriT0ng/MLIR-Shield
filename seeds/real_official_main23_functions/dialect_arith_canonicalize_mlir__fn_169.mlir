func.func @adduiExtendedConstantsOverflow2() -> (i32, i1) {
  %max = arith.constant 4294967295 : i32
  %sum, %overflow = arith.addui_extended %max, %max: i32, i1
  return %sum, %overflow : i32, i1
}
