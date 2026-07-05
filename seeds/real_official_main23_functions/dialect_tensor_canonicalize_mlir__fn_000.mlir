func.func @expand_shape_identity_fold(%arg0 : tensor<5xf32>) -> tensor<5xf32> {
  %0 = tensor.expand_shape %arg0 [[0]] output_shape [5] : tensor<5xf32> into tensor<5xf32>
  return %0 : tensor<5xf32>
}
