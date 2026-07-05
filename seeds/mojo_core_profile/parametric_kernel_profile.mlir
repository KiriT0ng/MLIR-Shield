module {
  func.func @mojo_parametric_profile(%arg0: index, %arg1: index) -> index {
    %c4 = arith.constant 4 : index
    %0 = arith.muli %arg0, %c4 : index
    %1 = arith.addi %0, %arg1 : index
    return %1 : index
  }
}
