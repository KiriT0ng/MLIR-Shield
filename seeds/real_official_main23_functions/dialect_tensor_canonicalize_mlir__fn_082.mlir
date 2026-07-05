func.func @zero_rank_reshape_multi(%arg0: tensor<f32>) -> tensor<f32> {
  %0 = tensor.expand_shape %arg0 [] output_shape [1] : tensor<f32> into tensor<1xf32>
  %1 = tensor.expand_shape %0 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
  %2 = tensor.collapse_shape %1 [] : tensor<1x1xf32> into tensor<f32>
  return %2 : tensor<f32>
}
