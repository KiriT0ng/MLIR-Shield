func.func @fold_identity_transpose(%arg0: memref<1x2x3x4x5xf32>) -> memref<1x2x3x4x5xf32> {
  %0 = memref.transpose %arg0 (d0, d1, d2, d3, d4) -> (d1, d0, d4, d3, d2) : memref<1x2x3x4x5xf32> to memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>>
  %1 = memref.transpose %0 (d1, d0, d4, d3, d2) -> (d0, d1, d2, d3, d4) : memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>> to memref<1x2x3x4x5xf32>
  return %1 : memref<1x2x3x4x5xf32>
}
