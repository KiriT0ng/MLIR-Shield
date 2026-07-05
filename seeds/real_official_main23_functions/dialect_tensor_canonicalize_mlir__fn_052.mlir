func.func @fold_gather_constant_splat(%indices : tensor<1x2x3xindex>) -> tensor<1x2x1x1x1xf32> {
  %cst = arith.constant dense<1.000000e-01> : tensor<4x4x4xf32>
  %0 = tensor.gather %cst[%indices] gather_dims([0, 1, 2]) :
    (tensor<4x4x4xf32>, tensor<1x2x 3xindex>) -> tensor<1x2x 1x1x1xf32>
  return %0 : tensor<1x2x 1x1x1xf32>
}
