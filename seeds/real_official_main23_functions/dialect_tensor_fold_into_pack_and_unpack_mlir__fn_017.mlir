func.func @linalg.pack_linalg_transpose_fold_dynamic_outer_and_tile_dims(%arg0: tensor<56x?x?x128xf32>) -> tensor<?x?x56x9x32x8x2xf32> {
  %0 = tensor.empty() : tensor<56x9x12x4x8x2x32xf32>
  %pack = linalg.pack %arg0
    inner_dims_pos = [1, 2, 3]
    inner_tiles = [8, 2, 32]
    into %0 : tensor<56x?x?x128xf32> -> tensor<56x9x12x4x8x2x32xf32>

  %1 = tensor.empty() : tensor<12x4x56x9x32x8x2xf32>
  %transposed = linalg.transpose
    ins(%pack : tensor<56x9x12x4x8x2x32xf32>)
    outs(%1 : tensor<12x4x56x9x32x8x2xf32>)
    permutation = [2, 3, 0, 1, 6, 4, 5]

  %return_value = tensor.cast %transposed : tensor<12x4x56x9x32x8x2xf32> to tensor<?x?x56x9x32x8x2xf32>
  return %return_value : tensor<?x?x56x9x32x8x2xf32>
}
