func.func @fold_cast_multiple_results(%arg0: tensor<2x2xf32>, %arg1: tensor<2x2xf32>) -> index {
  %cast = tensor.cast %arg0 : tensor<2x2xf32> to tensor<?x2xf32>
  %cast_0 = tensor.cast %arg1 : tensor<2x2xf32> to tensor<?x2xf32>
  %0:2 = test.destination_style_op ins(%cast : tensor<?x2xf32>) outs(%cast_0 : tensor<?x2xf32>) -> tensor<?x2xf32>, index
  return %0#1 : index
}
