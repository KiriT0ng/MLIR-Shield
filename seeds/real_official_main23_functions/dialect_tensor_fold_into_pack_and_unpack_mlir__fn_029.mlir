func.func @linalg_transpose_linalg.unpack_fold_dynamic_outer_dims_tile_dims_tile_sizes(%arg0: tensor<?x?x?x?xf32>, %transpose_dest: tensor<?x?x?x?xf32>, %unpack_dest: tensor<?x?xf32>, %tile_p : index, %tile_q : index) -> tensor<?x?xf32> {
  %transposed = linalg.transpose
    ins(%arg0 : tensor<?x?x?x?xf32>)
    outs(%transpose_dest : tensor<?x?x?x?xf32>)
    permutation = [1, 0, 3, 2]

  %unpack = linalg.unpack %transposed
    outer_dims_perm = [1, 0]
    inner_dims_pos = [0, 1]
    inner_tiles = [%tile_p, %tile_q]
    into %unpack_dest : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
  return %unpack : tensor<?x?xf32>
}
