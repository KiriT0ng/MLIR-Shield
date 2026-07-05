func.func @broadcast_splat_constant_dynamic_shape(%init: tensor<?x3xf32>) -> tensor<?x3xf32> {
  %cst = arith.constant dense<1.000000e+00> : tensor<3xf32>
  %0 = linalg.broadcast
      ins(%cst: tensor<3xf32>)
      outs(%init: tensor<?x3xf32>)
      dimensions = [0]
  return %0 : tensor<?x3xf32>
}
