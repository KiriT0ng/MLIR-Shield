func.func @fold_memref_expand_static_to_dynamic_multiple(%arg0 : memref<8x?xf32>, %arg1 : index, %arg2 : index) -> memref<8x1x?x?xf32> {
  %0 = memref.cast %arg0 : memref<8x?xf32> to memref<?x?xf32>
  %c0 = arith.constant 0 : index
  %dim0 = memref.dim %0, %c0 : memref<?x?xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2, 3]] output_shape [%dim0, 1, %arg1, %arg2]
      : memref<?x?xf32> into memref<?x1x?x?xf32>
  %2 = memref.cast %1 : memref<?x1x?x?xf32> to memref<8x1x?x?xf32>
  return %2 : memref<8x1x?x?xf32>
}
