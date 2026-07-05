func.func @adduiExtendedConstantsOverflow1() -> (i32, i1) {
  %max = arith.constant 4294967295 : i32
  %c1 = arith.constant 1 : i32
  %sum, %overflow = arith.addui_extended %max, %c1: i32, i1
  return %sum, %overflow : i32, i1
}
