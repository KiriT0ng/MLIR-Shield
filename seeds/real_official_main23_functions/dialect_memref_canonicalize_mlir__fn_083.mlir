func.func @fold_double_transpose(%arg0: memref<1x2x3x4x5xf32>) -> memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>> {
  %0 = memref.transpose %arg0 (d0, d1, d2, d3, d4) -> (d1, d0, d4, d3, d2) : memref<1x2x3x4x5xf32> to memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>>
  %1 = memref.transpose %0 (d1, d0, d4, d3, d2) -> (d4, d2, d1, d3, d0) : memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>> to memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>>
  return %1 : memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>>
}
