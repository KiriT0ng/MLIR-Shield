func.func @expand_shape_rank0_identity_fold(%arg0 : tensor<f32>) -> tensor<f32> {
  %0 = tensor.expand_shape %arg0 [] output_shape [] : tensor<f32> into tensor<f32>
  return %0 : tensor<f32>
}
