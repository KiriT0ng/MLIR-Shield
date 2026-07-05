func.func @collapse_shape_identity_fold(%arg0 : tensor<5x4xf32>) -> tensor<5x4xf32> {
  %0 = tensor.collapse_shape %arg0 [[0], [1]] : tensor<5x4xf32> into tensor<5x4xf32>
  return %0 : tensor<5x4xf32>
}
