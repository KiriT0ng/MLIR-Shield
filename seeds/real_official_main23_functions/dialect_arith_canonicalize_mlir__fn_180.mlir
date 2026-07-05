func.func @subuiExtendedConstants() -> (i32, i1) {
  %c5 = arith.constant 5 : i32
  %c3 = arith.constant 3 : i32
  %diff, %borrow = arith.subui_extended %c5, %c3: i32, i1
  return %diff, %borrow : i32, i1
}
