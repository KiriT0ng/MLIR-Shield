func.func @fold_padding_value_pack_negative3(%arg0: tensor<1200x500000xf32>, %arg1: tensor<?x1200x?x1xf32>, %tile : index) -> tensor<?x1200x?x1xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pack = linalg.pack %arg0
    padding_value(%cst : f32)
    outer_dims_perm = [1, 0]
    inner_dims_pos = [1, 0]
    inner_tiles = [%tile, 1]
    into %arg1 : tensor<1200x500000xf32> -> tensor<?x1200x?x1xf32>
  return %pack : tensor<?x1200x?x1xf32>
}
