func.func @adduiExtendedPoisonLhs() -> (i32, i1) {
  %poison = ub.poison : i32
  %c5 = arith.constant 5 : i32
  %sum, %overflow = arith.addui_extended %poison, %c5 : i32, i1
  return %sum, %overflow : i32, i1
}
