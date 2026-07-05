func.func @subuiExtendedSameOperand(%arg0: i32) -> (i32, i1) {
  %diff, %borrow = arith.subui_extended %arg0, %arg0: i32, i1
  return %diff, %borrow : i32, i1
}
