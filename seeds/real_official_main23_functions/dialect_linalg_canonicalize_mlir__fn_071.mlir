func.func @infer_dest_shape_unpack(%src: tensor<10x20x30x40x16xf32>, %dest: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
  %unpack = linalg.unpack %src
    outer_dims_perm = [2, 1, 3, 0]
    inner_dims_pos = [2]
    inner_tiles = [16]
    into %dest : tensor<10x20x30x40x16xf32> -> tensor<?x?x?x?xf32>
  return %unpack : tensor<?x?x?x?xf32>
}
