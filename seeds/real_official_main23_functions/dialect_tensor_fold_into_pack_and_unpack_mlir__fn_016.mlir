func.func @linalg.pack_linalg_transpose_fold_dynamic_outer_dims(%arg0: tensor<56x?x?x64xf32>) -> tensor<?x?x56x2x32xf32> {
  %0 = tensor.empty() : tensor<56x2x1x57x32xf32>
  %pack = linalg.pack %arg0
    outer_dims_perm = [0, 3, 2, 1]
    inner_dims_pos = [3]
    inner_tiles = [32]
    into %0 : tensor<56x?x?x64xf32> -> tensor<56x2x1x57x32xf32>

  %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
  %transposed = linalg.transpose
    ins(%pack : tensor<56x2x1x57x32xf32>)
    outs(%1 : tensor<1x57x56x2x32xf32>)
    permutation = [2, 3, 0, 1, 4]

  %return_value = tensor.cast %transposed : tensor<1x57x56x2x32xf32> to tensor<?x?x56x2x32xf32>
  return %return_value : tensor<?x?x56x2x32xf32>
}
