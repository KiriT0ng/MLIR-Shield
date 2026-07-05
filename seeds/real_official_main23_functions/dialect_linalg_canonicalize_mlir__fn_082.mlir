func.func @pack_unpack_different_tiles(%t: tensor<?x?x?x?xf32>, %dim1: index, %dim2: index, %dim3: index, %dim4: index, %dim5: index, %dim6: index,
                       %tile1: index, %tile2: index) -> tensor<?x?x?x?xf32> {
  %tensor_empty = tensor.empty(%dim1, %dim2) : tensor<?x?xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
  %tensor_empty1 = tensor.empty(%dim3, %dim4, %dim5, %dim6) : tensor<?x?x?x?xf32>
  %packed = linalg.pack %unpacked inner_dims_pos = [0, 1] inner_tiles = [%tile2, %tile1] into %tensor_empty1 : tensor<?x?xf32> -> tensor<?x?x?x?xf32>
  return %packed : tensor<?x?x?x?xf32>
}
