func.func @infer_src_shape_pack(%src: tensor<?x?x?x?xf32>, %dest: tensor<10x20x30x40x16xf32>) -> tensor<10x20x30x40x16xf32> {
  %cst = arith.constant 0.000000e+00 : f32
   %pack = linalg.pack %src
    padding_value(%cst : f32)
    outer_dims_perm = [2, 1, 3, 0]
    inner_dims_pos = [2]
    inner_tiles = [16]
    into %dest : tensor<?x?x?x?xf32> -> tensor<10x20x30x40x16xf32>
  return %pack : tensor<10x20x30x40x16xf32>
}
