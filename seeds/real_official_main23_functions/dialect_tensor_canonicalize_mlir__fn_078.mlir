func.func @compose_expand_of_collapse_0_rank_to_collapse(%arg0 : tensor<1x1x1x1xf32>)
    -> tensor<1x1x1xf32> {
  %0 = tensor.collapse_shape %arg0 []
      : tensor<1x1x1x1xf32> into tensor<f32>
  %1 = tensor.expand_shape %0 [] output_shape [1, 1, 1]
      : tensor<f32> into tensor<1x1x1xf32>
  return %1 : tensor<1x1x1xf32>
}
