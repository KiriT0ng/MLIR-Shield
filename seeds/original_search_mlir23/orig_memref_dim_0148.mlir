func.func @orig_memref_dim_148(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %n: index) -> index {
  %c0 = arith.constant 0 : index
  %sub = memref.subview %arg0[0, 0, 0] [1, %n, 1] [1, 1, 1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
  %d = memref.dim %sub, %c0 : memref<?xf32, strided<[?], offset: ?>>
  return %d : index
}
