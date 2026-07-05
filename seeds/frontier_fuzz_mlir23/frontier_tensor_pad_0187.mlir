func.func @frontier_tensor_pad_187(%arg0: tensor<4x4xf32>) -> tensor<7x7xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pad = tensor.pad %arg0 low[1, 1] high[2, 2] {
  ^bb0(%i: index, %j: index):
    tensor.yield %cst : f32
  } : tensor<4x4xf32> to tensor<7x7xf32>
  return %pad : tensor<7x7xf32>
}
