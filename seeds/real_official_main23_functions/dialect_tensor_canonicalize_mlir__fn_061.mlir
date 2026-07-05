func.func @collapse_of_cast(%t: tensor<8x12x32xf32>) -> tensor<?x32xf32> {
  %0 = tensor.cast %t : tensor<8x12x32xf32> to tensor<?x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1], [2]] : tensor<?x?x?xf32> into tensor<?x?xf32>
  %2 = tensor.cast %1 : tensor<?x?xf32> to tensor<?x32xf32>
  return %2 : tensor<?x32xf32>
}
