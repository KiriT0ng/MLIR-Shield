func.func @tripleMulIMulII32(%arg0: i32) -> i32 {
  %c_n3 = arith.constant -3 : i32
  %c7 = arith.constant 7 : i32
  %mul1 = arith.muli %arg0, %c_n3 : i32
  %mul2 = arith.muli %mul1, %c7 : i32
  return %mul2 : i32
}
