// mlirdiff-mock: verifier
module {
  func.func @verifier_sensitive(%arg0: i32) -> i32 {
    %0 = arith.addi %arg0, %arg0 : i32
    return %0 : i32
  }
}
