func.func @fold_collapse_of_expand_trailing_unit_dims(%arg0: tensor<2xf32>)
    -> tensor<2x1xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 1, 1] : tensor<2xf32> into tensor<2x1x1xf32>
  %1 = tensor.collapse_shape %0 [[0], [1, 2]]
      : tensor<2x1x1xf32> into tensor<2x1xf32>
  return %1 : tensor<2x1xf32>
}
