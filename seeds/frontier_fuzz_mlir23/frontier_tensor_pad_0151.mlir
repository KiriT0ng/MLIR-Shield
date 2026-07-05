func.func @frontier_tensor_pad_151(%arg0: tensor<3x2xf32>) -> tensor<6x5xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pad = tensor.pad %arg0 low[1, 1] high[2, 2] {
  ^bb0(%i: index, %j: index):
    tensor.yield %cst : f32
  } : tensor<3x2xf32> to tensor<6x5xf32>
  return %pad : tensor<6x5xf32>
}
