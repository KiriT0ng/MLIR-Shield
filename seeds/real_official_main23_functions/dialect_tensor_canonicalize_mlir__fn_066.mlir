func.func @fold_expand_of_collapse(%arg0 : tensor<3x4x4xf32>) -> tensor<3x4x4xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1], [2]]
      : tensor<3x4x4xf32> into tensor<12x4xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [3, 4, 4]
      : tensor<12x4xf32> into tensor<3x4x4xf32>
  return %1 : tensor<3x4x4xf32>
}
