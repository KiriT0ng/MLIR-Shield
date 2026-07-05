func.func @subuiExtendedConstantsBorrow() -> (i32, i1) {
  %c3 = arith.constant 3 : i32
  %c5 = arith.constant 5 : i32
  %diff, %borrow = arith.subui_extended %c3, %c5: i32, i1
  return %diff, %borrow : i32, i1
}
