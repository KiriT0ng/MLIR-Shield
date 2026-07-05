func.func @invalid_empty_negative_size() -> (tensor<4x5x?xf32>) {
  %c1 = arith.constant 1 : index
  %cn2 = arith.constant 2 : index
  %0 = index.sub %c1, %cn2
  %1 = tensor.empty(%0) : tensor<4x5x?xf32>
  return %1 : tensor<4x5x?xf32>
}
