func.func @dim_of_unranked(%unranked: memref<*xi32>) -> index {
  %c0 = arith.constant 0 : index
  %dim = memref.dim %unranked, %c0 : memref<*xi32>
  return %dim : index
}
