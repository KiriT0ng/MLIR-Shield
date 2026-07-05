func.func @fold_padding_value_pack_negative2(%arg0: tensor<1200x?xf32>, %arg1: tensor<?x1200x16x1xf32>) -> tensor<?x1200x16x1xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pack = linalg.pack %arg0
    padding_value(%cst : f32)
    outer_dims_perm = [1, 0]
    inner_dims_pos = [1, 0]
    inner_tiles = [16, 1]
    into %arg1 : tensor<1200x?xf32> -> tensor<?x1200x16x1xf32>
  return %pack : tensor<?x1200x16x1xf32>
}
