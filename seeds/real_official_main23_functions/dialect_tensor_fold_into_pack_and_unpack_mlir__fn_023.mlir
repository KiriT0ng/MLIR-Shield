func.func @linalg_transpose_linalg.pack_fold_complex_inner_dims_change(%arg0: tensor<25x30x35x40xf32>, %transpose_dest: tensor<35x40x25x30xf32>, %pack_dest: tensor<3x35x5x8x5x10x5xf32>) -> tensor<3x35x5x8x5x10x5xf32> {
  %transposed = linalg.transpose
    ins(%arg0 : tensor<25x30x35x40xf32>)
    outs(%transpose_dest : tensor<35x40x25x30xf32>)
    permutation = [2, 3, 0, 1]

  %pack = linalg.pack %transposed
    outer_dims_perm = [3, 0, 2, 1]
    inner_dims_pos = [1, 3, 2]
    inner_tiles = [5, 10, 5]
    into %pack_dest : tensor<35x40x25x30xf32> -> tensor<3x35x5x8x5x10x5xf32>
  return %pack : tensor<3x35x5x8x5x10x5xf32>
}
