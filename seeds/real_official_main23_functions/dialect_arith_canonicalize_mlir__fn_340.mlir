func.func @foldOrXor6(%arg0: index) -> index {
  %0 = arith.constant -1 : index
  %1 = arith.xori %arg0, %0 : index
  %2 = arith.ori %arg0, %1 : index
  return %2 : index
}
