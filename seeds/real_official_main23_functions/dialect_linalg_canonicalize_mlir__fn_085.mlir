func.func @pack_no_outer_dims_unpack_outer_dims(%t: tensor<16x16x?x?xf32>, %tile1: index, %tile2: index) -> tensor<16x16x?x?xf32> {
  %tensor_empty = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %t outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<16x16x?x?xf32> -> tensor<128x128xf32>
  %tensor_empty1 = tensor.empty(%tile1, %tile2) : tensor<16x16x?x?xf32>
  %packed = linalg.pack %unpacked inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty1 : tensor<128x128xf32> -> tensor<16x16x?x?xf32>
  return %packed : tensor<16x16x?x?xf32>
}
