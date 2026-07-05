func.func @subuiExtendedPoisonRhs() -> (i32, i1) {
  %c5 = arith.constant 5 : i32
  %poison = ub.poison : i32
  %diff, %borrow = arith.subui_extended %c5, %poison : i32, i1
  return %diff, %borrow : i32, i1
}
