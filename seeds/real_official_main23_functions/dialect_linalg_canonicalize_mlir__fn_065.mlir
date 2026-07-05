func.func @infer_dest_shape_pack(%src: tensor<30x20x?x10xf32>, %dest: tensor<?x?x?x?x16xf32>) -> tensor<?x?x?x?x16xf32> {
  %cst = arith.constant 0.000000e+00 : f32
   %pack = linalg.pack %src
    padding_value(%cst : f32)
    outer_dims_perm = [2, 1, 3, 0]
    inner_dims_pos = [2]
    inner_tiles = [16]
    into %dest : tensor<30x20x?x10xf32> -> tensor<?x?x?x?x16xf32>
  return %pack : tensor<?x?x?x?x16xf32>
}
