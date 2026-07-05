func.func @compose_collapse_of_expand_partially_dynamic(%arg0: memref<?xf16>, %arg1: index, %arg2: index) -> memref<8x?x?xf16> {
  %expanded = memref.expand_shape %arg0 [[0, 1, 2, 3, 4]] output_shape [4, 2, %arg1, %arg2, 32] : memref<?xf16> into memref<4x2x?x?x32xf16>
  %collapsed = memref.collapse_shape %expanded [[0, 1], [2], [3, 4]] : memref<4x2x?x?x32xf16> into memref<8x?x?xf16>
  return %collapsed : memref<8x?x?xf16>
}
