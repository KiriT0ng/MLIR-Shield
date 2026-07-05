func.func @compose_collapse_of_collapse_zero_dim(%arg0 : tensor<1x1x1xf32>)
    -> tensor<f32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1, 2]]
      : tensor<1x1x1xf32> into tensor<1xf32>
  %1 = tensor.collapse_shape %0 [] : tensor<1xf32> into tensor<f32>
  return %1 : tensor<f32>
}
