func.func @broadcast_same_shape(%input: tensor<2x3xf32>, %init: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %0 = linalg.broadcast ins(%input: tensor<2x3xf32>) outs(%init: tensor<2x3xf32>) dimensions = []
  return %0 : tensor<2x3xf32>
}
