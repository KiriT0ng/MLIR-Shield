func.func @pad_of_cast(%t: tensor<8x?xf32>, %s: index) -> tensor<8x32xf32> {
  %c0 = arith.constant 0 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.cast %t : tensor<8x?xf32> to tensor<?x?xf32>
  %1 = tensor.pad %0 low[%c0, %c0] high[%c0, %s]  {
  ^bb0(%arg9: index, %arg10: index):
    tensor.yield %cst : f32
  } : tensor<?x?xf32> to tensor<8x32xf32>
  return %1 : tensor<8x32xf32>
}
