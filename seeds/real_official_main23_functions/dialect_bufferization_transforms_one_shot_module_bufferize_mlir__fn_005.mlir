func.func @call_extract_slice(%arg0: tensor<4x8xf16>) -> (tensor<3x8xf16>) {
  %0 = tensor.extract_slice %arg0[1, 0] [3, 8] [1, 1] : tensor<4x8xf16> to tensor<3x8xf16>
  %1 = call @foo(%0) : (tensor<3x8xf16>) -> tensor<3x8xf16>
  return %1 : tensor<3x8xf16>
}
