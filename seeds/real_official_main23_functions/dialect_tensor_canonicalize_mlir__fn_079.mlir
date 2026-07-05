func.func @compose_expand_of_collapse_static(%arg0 : tensor<4x32x10x64x2xf16>) -> tensor<4x32x10x128xf16> {
  %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : tensor<4x32x10x64x2xf16> into tensor<128x10x128xf16>
  %expanded = tensor.expand_shape %collapsed [[0, 1], [2], [3]] output_shape [4, 32, 10, 128] : tensor<128x10x128xf16> into tensor<4x32x10x128xf16>
  return %expanded : tensor<4x32x10x128xf16>
}
