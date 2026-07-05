// mlirdiff-mock: assertion
module {
  func.func @assertion_sensitive(%arg0: i32) -> i32 {
    %0 = arith.addi %arg0, %arg0 : i32
    return %0 : i32
  }
}
