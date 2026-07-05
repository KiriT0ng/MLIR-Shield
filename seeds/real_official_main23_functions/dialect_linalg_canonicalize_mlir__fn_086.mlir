func.func @infer_and_fold_pack_unpack_same_tiles(%t: tensor<10x20x4x4xf32>) -> tensor<10x20x4x4xf32> {
  %dim1 = arith.constant 40 : index
  %dim2 = arith.constant 80 : index
  %tensor_empty = tensor.empty(%dim1, %dim2) : tensor<?x?xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [4, 4] into %tensor_empty : tensor<10x20x4x4xf32> -> tensor<?x?xf32>
  %cast = tensor.cast %unpacked : tensor<?x?xf32> to tensor<40x80xf32>
  %tensor_empty1 = tensor.empty() : tensor<10x20x4x4xf32>
  %packed = linalg.pack %cast inner_dims_pos = [0, 1] inner_tiles = [4, 4] into %tensor_empty1 : tensor<40x80xf32> -> tensor<10x20x4x4xf32>
  return %packed : tensor<10x20x4x4xf32>
}
