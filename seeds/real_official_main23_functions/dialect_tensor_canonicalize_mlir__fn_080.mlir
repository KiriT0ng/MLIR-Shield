func.func @compose_expand_of_collapse_dynamic(%arg0 : tensor<4x?x10x64x2xf16>, %arg1 : index) -> tensor<4x?x10x128xf16> {
  %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : tensor<4x?x10x64x2xf16> into tensor<?x10x128xf16>
  %expanded = tensor.expand_shape %collapsed [[0, 1], [2], [3]] output_shape [4, %arg1,  10, 128] : tensor<?x10x128xf16> into tensor<4x?x10x128xf16>
  return %expanded : tensor<4x?x10x128xf16>
}
