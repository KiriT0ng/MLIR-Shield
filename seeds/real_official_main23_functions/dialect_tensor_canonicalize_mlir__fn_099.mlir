func.func @collapse_shape_splat(%arg : f32) -> tensor<2x4xf32> {
  %c0 = tensor.splat %arg : tensor<2x2x2xf32>
  %0 = tensor.collapse_shape %c0 [[0], [1, 2]]
      : tensor<2x2x2xf32> into tensor<2x4xf32>
  return %0 : tensor<2x4xf32>
}
