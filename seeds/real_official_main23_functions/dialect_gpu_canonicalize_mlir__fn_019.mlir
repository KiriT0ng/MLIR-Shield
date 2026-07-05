func.func @out_of_bound_memref.dim(%arg : memref<?xi8>, %size: index) -> index {
  %c2 = arith.constant 2 : index
  %1 = memref.dim %arg, %c2 : memref<?xi8>
  return %1 : index
}
