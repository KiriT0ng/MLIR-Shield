func.func @not_fold_memref_expand_with_dynamic_to_static_cast(%arg0 : memref<?x4xf32>) -> memref<2x1x4x4xf32> {
  %0 = memref.cast %arg0 : memref<?x4xf32> to memref<8x4xf32>
  %1 = memref.expand_shape %0 [[0, 1, 2], [3]] output_shape [2, 1, 4, 4]
      : memref<8x4xf32> into memref<2x1x4x4xf32>
  return %1 : memref<2x1x4x4xf32>
}
