func.func @andOfAndConstantChain(%arg0: i32) -> (i32, i32, i32) {
  %c14 = arith.constant 14 : i32
  %c13 = arith.constant 13 : i32
  %c11 = arith.constant 11 : i32
  %a1 = arith.andi %arg0, %c14 : i32
  %a2 = arith.andi %a1, %c13 : i32
  %a3 = arith.andi %a2, %c11 : i32
  return %a1, %a2, %a3 : i32, i32, i32
}
