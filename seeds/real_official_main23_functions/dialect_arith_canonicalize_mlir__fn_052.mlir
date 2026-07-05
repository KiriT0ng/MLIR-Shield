func.func @andOfAndConstantIndex(%arg0: index) -> index {
  %c12 = arith.constant 12 : index
  %c10 = arith.constant 10 : index
  %a1 = arith.andi %arg0, %c12 : index
  %a2 = arith.andi %a1, %c10 : index
  return %a2 : index
}
