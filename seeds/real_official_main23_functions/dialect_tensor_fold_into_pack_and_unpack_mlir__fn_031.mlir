func.func @tensor_padded_unpack_linalg_transpose_fold(%arg0: tensor<71x7x4x16x16xf32>) -> tensor<100x71x64xf32> {
  %0 = tensor.empty() : tensor<71x100x64xf32>
  %pack = linalg.unpack %arg0
    inner_dims_pos = [1, 2]
    inner_tiles = [16, 16]
    into %0 : tensor<71x7x4x16x16xf32> -> tensor<71x100x64xf32>

  %1 = tensor.empty() : tensor<100x71x64xf32>
  %transposed = linalg.transpose
    ins(%pack : tensor<71x100x64xf32>)
    outs(%1 : tensor<100x71x64xf32>)
    permutation = [1, 0, 2]
  return %transposed : tensor<100x71x64xf32>
}
