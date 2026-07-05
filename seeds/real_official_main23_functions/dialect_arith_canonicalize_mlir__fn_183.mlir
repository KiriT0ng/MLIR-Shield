func.func @subuiExtendedPoisonLhs() -> (i32, i1) {
  %poison = ub.poison : i32
  %c5 = arith.constant 5 : i32
  %diff, %borrow = arith.subui_extended %poison, %c5 : i32, i1
  return %diff, %borrow : i32, i1
}
