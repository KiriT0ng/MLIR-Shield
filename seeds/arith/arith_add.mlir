module {
  func.func @add(%lhs: i32, %rhs: i32) -> i32 {
    %0 = arith.addi %lhs, %rhs : i32
    return %0 : i32
  }
}
