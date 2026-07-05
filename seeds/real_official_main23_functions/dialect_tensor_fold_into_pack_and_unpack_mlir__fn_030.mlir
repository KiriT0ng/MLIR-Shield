func.func @linalg.unpack_linalg_transpose_fold(%arg0: tensor<56x57x1x64xf32>) -> tensor<3648x56xf32> {
  %0 = tensor.empty() : tensor<56x3648xf32>
  %pack = linalg.unpack %arg0
    outer_dims_perm = [0, 1]
    inner_dims_pos = [0, 1]
    inner_tiles = [1, 64]
    into %0 : tensor<56x57x1x64xf32> -> tensor<56x3648xf32>

  %1 = tensor.empty() : tensor<3648x56xf32>
  %transposed = linalg.transpose
    ins(%pack : tensor<56x3648xf32>)
    outs(%1 : tensor<3648x56xf32>)
    permutation = [1,0]
  return %transposed : tensor<3648x56xf32>
}
