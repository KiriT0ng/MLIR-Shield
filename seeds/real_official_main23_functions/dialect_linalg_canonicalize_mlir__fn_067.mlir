func.func @fold_padding_value_pack_negative1(%arg0: tensor<1200x499999xf32>) -> tensor<31250x1200x16x1xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<31250x1200x16x1xf32>
  %pack = linalg.pack %arg0
    padding_value(%cst : f32)
    outer_dims_perm = [1, 0]
    inner_dims_pos = [1, 0]
    inner_tiles = [16, 1]
    into %0 : tensor<1200x499999xf32> -> tensor<31250x1200x16x1xf32>
  return %pack : tensor<31250x1200x16x1xf32>
}
