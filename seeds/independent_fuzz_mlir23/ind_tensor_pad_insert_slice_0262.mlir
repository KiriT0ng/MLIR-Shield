func.func @ind_tensor_pad_insert_slice_262(%src: tensor<4x3xf32>, %dst: tensor<6x5xf32>) -> tensor<6x5xf32> {
  %zero = arith.constant 0.000000e+00 : f32
  %padded = tensor.pad %src low[1, 1] high[1, 1] {
  ^bb0(%i: index, %j: index):
    tensor.yield %zero : f32
  } : tensor<4x3xf32> to tensor<6x5xf32>
  %out = tensor.insert_slice %padded into %dst[0, 0] [6, 5] [1, 1] : tensor<6x5xf32> into tensor<6x5xf32>
  return %out : tensor<6x5xf32>
}
