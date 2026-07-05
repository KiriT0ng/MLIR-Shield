func.func @linalg.pack_linalg_transpose_fold_tile_dims_outer_dims_transpose(%arg0: tensor<56x72x24x128xf32>) -> tensor<9x56x2x12x32x8x4xf32> {
  %0 = tensor.empty() : tensor<4x12x9x56x8x2x32xf32>
  %pack = linalg.pack %arg0
    outer_dims_perm = [3, 2, 1, 0]
    inner_dims_pos = [1, 2, 3]
    inner_tiles = [8, 2, 32]
    into %0 : tensor<56x72x24x128xf32> -> tensor<4x12x9x56x8x2x32xf32>

  %1 = tensor.empty() : tensor<9x56x2x12x32x8x4xf32>
  %transposed = linalg.transpose
    ins(%pack : tensor<4x12x9x56x8x2x32xf32>)
    outs(%1 : tensor<9x56x2x12x32x8x4xf32>)
    permutation = [2, 3, 5, 1, 6, 4, 0]
  return %transposed : tensor<9x56x2x12x32x8x4xf32>
}
