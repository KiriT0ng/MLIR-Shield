func.func @compose_collapse_of_expand_partially_dynamic(%arg0: tensor<?xf16>, %arg1: index, %arg2: index) -> tensor<8x?x?xf16> {
  %expanded = tensor.expand_shape %arg0 [[0, 1, 2, 3, 4]] output_shape [4, 2, %arg1, %arg2, 32] : tensor<?xf16> into tensor<4x2x?x?x32xf16>
  %collapsed = tensor.collapse_shape %expanded [[0, 1], [2], [3, 4]] : tensor<4x2x?x?x32xf16> into tensor<8x?x?xf16>
  return %collapsed : tensor<8x?x?xf16>
}
