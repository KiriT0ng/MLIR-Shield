func.func @no_crash_dim_of_ambiguous_subview(
    %arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index) -> index {
  %c1 = arith.constant 1 : index
  %subview = memref.subview %arg0[0, 0, 0] [1, %arg1, 1] [1, 1, 1]
      : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<1x?xf32, strided<[?, ?], offset: ?>>
  %dim = memref.dim %subview, %c1 : memref<1x?xf32, strided<[?, ?], offset: ?>>
  return %dim : index
}
