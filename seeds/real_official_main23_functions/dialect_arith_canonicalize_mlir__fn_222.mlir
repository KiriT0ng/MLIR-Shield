func.func @xorOfXorConstantIndex(%arg0: index) -> index {
  %c12 = arith.constant 12 : index
  %c10 = arith.constant 10 : index
  %x1 = arith.xori %arg0, %c12 : index
  %x2 = arith.xori %x1, %c10 : index
  return %x2 : index
}
