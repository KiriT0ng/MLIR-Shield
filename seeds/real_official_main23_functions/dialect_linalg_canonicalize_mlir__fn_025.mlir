func.func @negative_fold_pad_fill_value_mismatch() -> tensor<412x276xf32> {
  %f0 = arith.constant 0.0 : f32
  %f1 = arith.constant 1.0 : f32
  %empty = tensor.empty() : tensor<400x273xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<400x273xf32>) -> tensor<400x273xf32>
  %pad = tensor.pad %fill low[4, 1] high[8, 2] {
  ^bb0(%arg1: index, %arg2: index):
    tensor.yield %f1 : f32
  } : tensor<400x273xf32> to tensor<412x276xf32>
  return %pad : tensor<412x276xf32>
}
