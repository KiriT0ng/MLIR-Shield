func.func @andOfAndConstantMultiUse(%arg0: i32) -> (i32, i32) {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %a1 = arith.andi %arg0, %c12 : i32
  %a2 = arith.andi %a1, %c10 : i32
  return %a1, %a2 : i32, i32
}
