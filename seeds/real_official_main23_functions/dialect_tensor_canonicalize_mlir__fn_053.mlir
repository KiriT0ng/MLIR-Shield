func.func @fold_reshape_constant_splat(%shape : tensor<1xi32>) -> tensor<4xf32> {
  %cst = arith.constant dense<1.000000e-01> : tensor<4x1xf32>
  %0 = tensor.reshape %cst(%shape)
             : (tensor<4x1xf32>, tensor<1xi32>) -> tensor<4xf32>
  return %0 : tensor<4xf32>
}
