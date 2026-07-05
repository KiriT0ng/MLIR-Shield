func.func @not_fold_memref_expand_static_to_dynamic_cast_if_really_dynamic(%arg0 : memref<8x4xf32>, %arg1 : index) -> memref<2x1x4x4xf32> {
  %0 = memref.cast %arg0 : memref<8x4xf32> to memref<?x4xf32>
  %c0 = arith.constant 0 : index
  %dim0 = memref.dim %0, %c0 : memref<?x4xf32>
  %dim_ext = arith.divui %dim0 , %arg1: index
  %1 = memref.expand_shape %0 [[0, 1, 2], [3]] output_shape [%dim_ext, 1, 4, 4]
      : memref<?x4xf32> into memref<?x1x4x4xf32>
  %2 = memref.cast %1 : memref<?x1x4x4xf32> to memref<2x1x4x4xf32>
  return %2 : memref<2x1x4x4xf32>
}
