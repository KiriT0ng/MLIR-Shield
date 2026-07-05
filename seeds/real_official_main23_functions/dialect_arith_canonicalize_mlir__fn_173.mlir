func.func @adduiExtendedPoisonRhs() -> (i32, i1) {
  %c5 = arith.constant 5 : i32
  %poison = ub.poison : i32
  %sum, %overflow = arith.addui_extended %c5, %poison : i32, i1
  return %sum, %overflow : i32, i1
}
