func.func @fold_dynamic_pad_fill(%empty: tensor<8x?x16x32xf32>, %low0: index, %low3: index, %high2: index, %high3: index) -> tensor<?x?x?x?xf32> {
  %f0 = arith.constant 0.0 : f32
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<8x?x16x32xf32>) -> tensor<8x?x16x32xf32>
  %pad = tensor.pad %fill low[%low0, 8, 7, %low3] high[1, 2, %high2, %high3] {
  ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
    tensor.yield %f0 : f32
  } : tensor<8x?x16x32xf32> to tensor<?x?x?x?xf32>
  return %pad : tensor<?x?x?x?xf32>
}
