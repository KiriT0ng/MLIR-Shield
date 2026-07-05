func.func @tensor.cast_chain_ok(%input: tensor<*xi32>) -> tensor<4x8xi32> {
  %0 = tensor.cast %input : tensor<*xi32> to tensor<4x?xi32>
  %1 = tensor.cast %0 : tensor<4x?xi32> to tensor<4x8xi32>
  return %1 : tensor<4x8xi32>
}
