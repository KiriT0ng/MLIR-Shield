func.func @fold_memref_expand_cast(%arg0 : memref<?x?xf32>) -> memref<2x4x4xf32> {
  %0 = memref.cast %arg0 : memref<?x?xf32> to memref<8x4xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2]] output_shape [2, 4, 4]
      : memref<8x4xf32> into memref<2x4x4xf32>
  return %1 : memref<2x4x4xf32>
}
