func.func @frontier_tensor_pad_181(%arg0: tensor<3x3xf32>) -> tensor<4x4xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pad = tensor.pad %arg0 low[1, 1] high[0, 0] {
  ^bb0(%i: index, %j: index):
    tensor.yield %cst : f32
  } : tensor<3x3xf32> to tensor<4x4xf32>
  return %pad : tensor<4x4xf32>
}
