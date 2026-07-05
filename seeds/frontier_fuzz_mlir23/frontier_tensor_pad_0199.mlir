func.func @frontier_tensor_pad_199(%arg0: tensor<6x6xf32>) -> tensor<7x7xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pad = tensor.pad %arg0 low[1, 1] high[0, 0] {
  ^bb0(%i: index, %j: index):
    tensor.yield %cst : f32
  } : tensor<6x6xf32> to tensor<7x7xf32>
  return %pad : tensor<7x7xf32>
}
