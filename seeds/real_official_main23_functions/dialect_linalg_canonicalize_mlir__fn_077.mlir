func.func @unpack_pack(%t: tensor<128x128xf32>, %tile1: index, %tile2: index) -> tensor<128x128xf32> {
  %tensor_empty = tensor.empty(%tile1, %tile2) : tensor<16x16x?x?xf32>
  %packed = linalg.pack %t inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<128x128xf32> -> tensor<16x16x?x?xf32>
  %tensor_empty1 = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty1 : tensor<16x16x?x?xf32> -> tensor
<128x128xf32>
  return %unpacked : tensor<128x128xf32>
}
