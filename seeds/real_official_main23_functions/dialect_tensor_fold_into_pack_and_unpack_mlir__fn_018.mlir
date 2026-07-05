func.func @linalg.pack_linalg_transpose_fold_dynamic_outer_dims_tile_dims_tile_sizes(%arg0: tensor<?x?x?x?xf32>, %pack_dest: tensor<?x?x?x?x?x?x?xf32>, %transpose_dest: tensor<?x?x?x?x?x?x?xf32>, %tile_p : index, %tile_q : index, %tile_r : index) -> tensor<?x?x?x?x?x?x?xf32> {
  %pack = linalg.pack %arg0
    outer_dims_perm = [3, 0, 2, 1]
    inner_dims_pos = [1, 2, 3]
    inner_tiles = [%tile_p, %tile_q, %tile_r]
    into %pack_dest : tensor<?x?x?x?xf32> -> tensor<?x?x?x?x?x?x?xf32>

  %transposed = linalg.transpose
    ins(%pack : tensor<?x?x?x?x?x?x?xf32>)
    outs(%transpose_dest : tensor<?x?x?x?x?x?x?xf32>)
    permutation = [2, 3, 0, 1, 6, 4, 5]

  return %transposed : tensor<?x?x?x?x?x?x?xf32>
}
