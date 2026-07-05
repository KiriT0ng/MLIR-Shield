func.func @linalg.pack_linalg_transpose_fold_tile_dims_transpose(%arg0: tensor<56x72x24x128xf32>) -> tensor<12x56x4x9x32x8x2xf32> {
  %0 = tensor.empty() : tensor<4x9x12x56x8x2x32xf32>
  %pack = linalg.pack %arg0
    outer_dims_perm = [3, 1, 2, 0]
    inner_dims_pos = [1, 2, 3]
    inner_tiles = [8, 2, 32]
    into %0 : tensor<56x72x24x128xf32> -> tensor<4x9x12x56x8x2x32xf32>

  %1 = tensor.empty() : tensor<12x56x4x9x32x8x2xf32>
  %transposed = linalg.transpose
    ins(%pack : tensor<4x9x12x56x8x2x32xf32>)
    outs(%1 : tensor<12x56x4x9x32x8x2xf32>)
    permutation = [2, 3, 0, 1, 6, 4, 5]
  return %transposed : tensor<12x56x4x9x32x8x2xf32>
}
