func.func @linalg.pack_linalg_transpose_fold_with_padding(%arg0: tensor<56x57x1x55xf32>, %padding: f32) -> tensor<1x57x56x2x32xf32> {
  %0 = tensor.empty() : tensor<56x2x1x57x32xf32>
  %pack = linalg.pack %arg0 padding_value(%padding : f32)
    outer_dims_perm = [0, 3, 2, 1]
    inner_dims_pos = [3]
    inner_tiles = [32]
    into %0 : tensor<56x57x1x55xf32> -> tensor<56x2x1x57x32xf32>

  %1 = tensor.empty() : tensor<1x57x56x2x32xf32>
  %transposed = linalg.transpose
    ins(%pack : tensor<56x2x1x57x32xf32>)
    outs(%1 : tensor<1x57x56x2x32xf32>)
    permutation = [2, 3, 0, 1, 4]
  return %transposed : tensor<1x57x56x2x32xf32>
}
