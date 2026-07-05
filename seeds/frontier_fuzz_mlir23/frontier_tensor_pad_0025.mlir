func.func @frontier_tensor_pad_25(%arg0: tensor<2x2xf32>) -> tensor<5x5xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pad = tensor.pad %arg0 low[1, 1] high[2, 2] {
  ^bb0(%i: index, %j: index):
    tensor.yield %cst : f32
  } : tensor<2x2xf32> to tensor<5x5xf32>
  return %pad : tensor<5x5xf32>
}
