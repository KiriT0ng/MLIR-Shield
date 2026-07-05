func.func @orig_memref_dim_297(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %n: index) -> index {
  %c1 = arith.constant 1 : index
  %sub = memref.subview %arg0[0, 0] [1, %n] [1, 1] : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<1x?xf32, strided<[?, ?], offset: ?>>
  %d = memref.dim %sub, %c1 : memref<1x?xf32, strided<[?, ?], offset: ?>>
  return %d : index
}
