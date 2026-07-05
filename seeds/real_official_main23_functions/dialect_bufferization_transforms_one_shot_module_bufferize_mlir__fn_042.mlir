func.func @ranked_return_via_unranked_call(%arg0: tensor<64x20x40xf32>) -> tensor<64x20x40xf32> {
  %u = tensor.cast %arg0 : tensor<64x20x40xf32> to tensor<*xf32>
  %r = call @relu_unranked(%u) : (tensor<*xf32>) -> tensor<*xf32>
  %b = tensor.cast %r : tensor<*xf32> to tensor<64x20x40xf32>
  return %b : tensor<64x20x40xf32>
}
