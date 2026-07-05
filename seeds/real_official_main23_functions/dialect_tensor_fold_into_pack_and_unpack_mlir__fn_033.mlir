func.func @unpack_non_involution_transpose_fold(%arg0: tensor<57x3x56x1x64xf32>) -> tensor<3648x3x56xf32> {
  %0 = tensor.empty() : tensor<3x56x3648xf32>
  %unpack = linalg.unpack %arg0
    outer_dims_perm = [2, 0, 1]
    inner_dims_pos = [1, 2]
    inner_tiles = [1, 64]
    into %0 : tensor<57x3x56x1x64xf32> -> tensor<3x56x3648xf32>

  %1 = tensor.empty() : tensor<3648x3x56xf32>
  %transposed = linalg.transpose
    ins(%unpack : tensor<3x56x3648xf32>)
    outs(%1 : tensor<3648x3x56xf32>)
    permutation = [2, 0, 1]
  return %transposed : tensor<3648x3x56xf32>
}
