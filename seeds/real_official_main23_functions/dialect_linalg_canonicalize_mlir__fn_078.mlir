func.func @negative_unpack_pack_with_padding_no_canonicalization(%t: tensor<256x512xbf16>) -> tensor<224x512xbf16> {
  %tensor_empty = tensor.empty() : tensor<4x16x64x32xbf16>
  %tensor_empty1 = tensor.empty() : tensor<224x512xbf16>
  %packed = linalg.pack %t outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [64, 32] into %tensor_empty : tensor<256x512xbf16> -> tensor<4x16x64x32xbf16>
  %unpacked = linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [64, 32] into %tensor_empty1 : tensor<4x16x64x32xbf16> -> tensor<224x512xbf16>
  return %unpacked : tensor<224x512xbf16>
}
