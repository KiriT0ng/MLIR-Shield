module {
  func.func @fold_const() -> i32 {
    %c1 = arith.constant 1 : i32
    %c2 = arith.constant 2 : i32
    %0 = arith.addi %c1, %c2 : i32
    return %0 : i32
  }
}
