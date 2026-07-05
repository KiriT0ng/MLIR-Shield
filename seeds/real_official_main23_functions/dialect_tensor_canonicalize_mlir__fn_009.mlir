func.func @tensor.cast_chain_keep(%input: tensor<?x?xi32>) -> tensor<?x8xi32> {
  %0 = tensor.cast %input : tensor<?x?xi32> to tensor<4x?xi32>
  %1 = tensor.cast %0 : tensor<4x?xi32> to tensor<?x8xi32>
  return %1 : tensor<?x8xi32>
}
