func.func @orig_memref_dim_78(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %n: index) -> index {
  %c0 = arith.constant 0 : index
  %sub = memref.subview %arg0[0, 0] [%n, 1] [1, 1] : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?x1xf32, strided<[?, ?], offset: ?>>
  %d = memref.dim %sub, %c0 : memref<?x1xf32, strided<[?, ?], offset: ?>>
  return %d : index
}
