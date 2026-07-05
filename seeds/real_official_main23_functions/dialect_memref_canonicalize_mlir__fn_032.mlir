func.func @fold_memref_expand_with_static_to_dynamic_cast(%arg0: memref<8x4xf32>) -> memref<2x1x4x4xf32> {
  %c2 = arith.constant 2 : index
  %cast = memref.cast %arg0 : memref<8x4xf32> to memref<?x4xf32>
  %expand_shape = memref.expand_shape %cast [[0, 1, 2], [3]] output_shape [%c2, 1, 4, 4]
      : memref<?x4xf32> into memref<?x1x4x4xf32>
  %cast_0 = memref.cast %expand_shape : memref<?x1x4x4xf32> to memref<2x1x4x4xf32>
  return %cast_0 : memref<2x1x4x4xf32>
}
