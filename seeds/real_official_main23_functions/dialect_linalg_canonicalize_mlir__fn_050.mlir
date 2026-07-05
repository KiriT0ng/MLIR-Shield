func.func @broadcast_splat_constant_to_dense(%init: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %cst = arith.constant dense<1.000000e+00> : tensor<3xf32>
  %0 = linalg.broadcast
      ins(%cst: tensor<3xf32>)
      outs(%init: tensor<2x3xf32>)
      dimensions = [0]
  return %0 : tensor<2x3xf32>
}
