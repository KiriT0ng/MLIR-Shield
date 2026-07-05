func.func @subuiExtendedZeroRhs(%arg0: i32) -> (i32, i1) {
  %zero = arith.constant 0 : i32
  %diff, %borrow = arith.subui_extended %arg0, %zero: i32, i1
  return %diff, %borrow : i32, i1
}
