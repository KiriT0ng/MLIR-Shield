func.func @tensor_bitcast_chain_nop(%input: tensor<4xi32>) -> tensor<4xi32> {
  %0 = tensor.bitcast %input : tensor<4xi32> to tensor<4xui32>
  %1 = tensor.bitcast %0 : tensor<4xui32> to tensor<4xi32>
  return %1 : tensor<4xi32>
}
