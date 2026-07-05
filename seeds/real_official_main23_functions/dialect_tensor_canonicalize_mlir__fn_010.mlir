func.func @tensor.cast_chain_invalid(%input: tensor<4x8xi32>) -> tensor<8x4xi32> {
  %0 = tensor.cast %input : tensor<4x8xi32> to tensor<?x?xi32>
  %1 = tensor.cast %0 : tensor<?x?xi32> to tensor<8x4xi32>
  return %1 : tensor<8x4xi32>
}
