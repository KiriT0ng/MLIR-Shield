func.func @orOfOrConstantIndex(%arg0: index) -> index {
  %c12 = arith.constant 12 : index
  %c10 = arith.constant 10 : index
  %o1 = arith.ori %arg0, %c12 : index
  %o2 = arith.ori %o1, %c10 : index
  return %o2 : index
}
