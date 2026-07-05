func.func @linalg_transpose_linalg.pack_fold_no_outer_dims_perm(%arg0: tensor<56x57x1x64xf32>) -> tensor<1x56x57x2x32xf32> {
  %0 = tensor.empty() : tensor<1x56x57x64xf32>
  %transposed = linalg.transpose
    ins(%arg0 : tensor<56x57x1x64xf32>)
    outs(%0 : tensor<1x56x57x64xf32>)
    permutation = [2, 0, 1, 3]

  %1 = tensor.empty() : tensor<1x56x57x2x32xf32>
  %pack = linalg.pack %transposed
    inner_dims_pos = [3]
    inner_tiles = [32]
    into %1 : tensor<1x56x57x64xf32> -> tensor<1x56x57x2x32xf32>
  return %pack : tensor<1x56x57x2x32xf32>
}
