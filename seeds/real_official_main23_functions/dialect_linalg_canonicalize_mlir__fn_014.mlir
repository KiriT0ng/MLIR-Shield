func.func @fold_fill_reshape() -> tensor<6x4xf32> {
  %zero = arith.constant 0.0 : f32
  %empty = tensor.empty() : tensor<1x2x3x4xf32>
  %fill = linalg.fill ins(%zero : f32) outs(%empty : tensor<1x2x3x4xf32>) -> tensor<1x2x3x4xf32>
  %reshape = tensor.collapse_shape %fill [[0, 1, 2], [3]]
      : tensor<1x2x3x4xf32> into tensor<6x4xf32>
  return %reshape : tensor<6x4xf32>
}
