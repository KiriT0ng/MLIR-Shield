func.func @subuiExtendedUnusedBorrowScalar(%arg0: i32, %arg1: i32) -> i32 {
  %diff, %borrow = arith.subui_extended %arg0, %arg1: i32, i1
  return %diff : i32
}
