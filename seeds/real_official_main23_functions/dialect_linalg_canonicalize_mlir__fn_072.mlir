func.func @infer_src_shape_unpack(%src: tensor<?x?x?x?x16xf32>, %dest: tensor<30x20x?x10xf32>) -> tensor<30x20x?x10xf32> {
  %unpack = linalg.unpack %src
    outer_dims_perm = [2, 1, 3, 0]
    inner_dims_pos = [2]
    inner_tiles = [16]
    into %dest : tensor<?x?x?x?x16xf32> -> tensor<30x20x?x10xf32>
  return %unpack : tensor<30x20x?x10xf32>
}
