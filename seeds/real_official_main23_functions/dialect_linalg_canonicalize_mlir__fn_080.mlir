func.func @pack_unpack(%t: tensor<16x16x8x8xf32>) -> tensor<16x16x8x8xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %tensor_empty = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty : tensor<16x16x8x8xf32> -> tensor<128x128xf32>
  %tensor_empty1 = tensor.empty() : tensor<16x16x8x8xf32>
  %packed = linalg.pack %unpacked padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty1 : tensor<128x128xf32> -> tensor<16x16x8x8xf32>
  return %packed : tensor<16x16x8x8xf32>
}
