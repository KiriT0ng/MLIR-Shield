func.func @fold_memref_expand_static_to_dynamic_partial_with_arith_const_as_dim(%arg0 : memref<8x?xf32>) -> memref<1x8x1x?xf32> {
  %0 = memref.cast %arg0 : memref<8x?xf32> to memref<?x?xf32>
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %dim0 = memref.dim %0, %c0 : memref<?x?xf32>
  %dim1 = memref.dim %0, %c1 : memref<?x?xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2, 3]] output_shape [%c1, %dim0, %c1, %dim1]
      : memref<?x?xf32> into memref<?x?x?x?xf32>
  %2 = memref.cast %1 : memref<?x?x?x?xf32> to memref<1x8x1x?xf32>
  return %2 : memref<1x8x1x?xf32>
}
