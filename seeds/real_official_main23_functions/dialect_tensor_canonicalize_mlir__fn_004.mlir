func.func @tensor_bitcast_chain_ok(%input: tensor<2xi32>) -> tensor<2xf32> {
  %0 = tensor.bitcast %input : tensor<2xi32> to tensor<2xui32>
  %1 = tensor.bitcast %0 : tensor<2xui32> to tensor<2xf32>
  return %1 : tensor<2xf32>
}
