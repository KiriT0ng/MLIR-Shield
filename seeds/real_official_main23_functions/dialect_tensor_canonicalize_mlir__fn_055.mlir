func.func @fold_reshape_1d(%input: tensor<?xf32>, %shape: tensor<1xindex>) -> tensor<?xf32> {
  %0 = tensor.reshape %input(%shape) : (tensor<?xf32>, tensor<1xindex>) -> tensor<?xf32>
  return %0 : tensor<?xf32>
}
