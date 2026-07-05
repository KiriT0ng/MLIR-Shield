func.func @fold_reshape_0d(%input: tensor<f32>, %shape: tensor<0xindex>) -> tensor<f32> {
  %0 = tensor.reshape %input(%shape) : (tensor<f32>, tensor<0xindex>) -> tensor<f32>
  return %0 : tensor<f32>
}
