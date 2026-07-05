func.func @unpack_pack(%t: tensor<128x128xf32>) -> tensor<128x128xf32> {
  %tensor_empty = tensor.empty() : tensor<16x16x8x8xf32>
  %packed = linalg.pack %t outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [8, 8] into %tensor_empty : tensor<128x128xf32> -> tensor<16x16x8x8xf32>
  %tensor_empty1 = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty1 : tensor<16x16x8x8xf32> -> tensor
<128x128xf32>
  return %unpacked : tensor<128x128xf32>
}
