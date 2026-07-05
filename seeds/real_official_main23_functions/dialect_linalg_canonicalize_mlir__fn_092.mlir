func.func @fold_pack_unpack_tensor(%x: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %unpacked = linalg.unpack %x outer_dims_perm = [] inner_dims_pos = [] inner_tiles = []
             into %x : tensor<2x3xf32> -> tensor<2x3xf32>
  %packed = linalg.pack %unpacked outer_dims_perm = [] inner_dims_pos = [] inner_tiles = []
             into %x : tensor<2x3xf32> -> tensor<2x3xf32>
  return %packed : tensor<2x3xf32>
}
