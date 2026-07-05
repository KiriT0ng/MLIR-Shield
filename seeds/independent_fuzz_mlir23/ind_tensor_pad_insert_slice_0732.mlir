func.func @ind_tensor_pad_insert_slice_732(%src: tensor<2x5xf32>, %dst: tensor<4x7xf32>) -> tensor<4x7xf32> {
  %zero = arith.constant 0.000000e+00 : f32
  %padded = tensor.pad %src low[1, 1] high[1, 1] {
  ^bb0(%i: index, %j: index):
    tensor.yield %zero : f32
  } : tensor<2x5xf32> to tensor<4x7xf32>
  %out = tensor.insert_slice %padded into %dst[0, 0] [4, 7] [1, 1] : tensor<4x7xf32> into tensor<4x7xf32>
  return %out : tensor<4x7xf32>
}
