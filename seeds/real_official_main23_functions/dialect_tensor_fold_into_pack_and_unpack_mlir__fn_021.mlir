func.func @linalg_transpose_linalg.pack_fold_with_padding(%arg0: tensor<56x57x1x55xf32>, %padding: f32) -> tensor<1x57x56x2x32xf32> {
  %0 = tensor.empty() : tensor<1x56x57x55xf32>
  %transpose = linalg.transpose
    ins(%arg0 : tensor<56x57x1x55xf32>)
    outs(%0 : tensor<1x56x57x55xf32>)
    permutation = [2, 0, 1, 3]

  %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
  %pack = linalg.pack %transpose padding_value(%padding : f32)
    outer_dims_perm = [0, 2, 1, 3]
    inner_dims_pos = [3]
    inner_tiles = [32]
    into %1 : tensor<1x56x57x55xf32> -> tensor<1x57x56x2x32xf32>
  return %pack : tensor<1x57x56x2x32xf32>
}
