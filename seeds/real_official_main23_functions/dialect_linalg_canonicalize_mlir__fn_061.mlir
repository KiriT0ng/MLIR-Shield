func.func @fold_padding_value_pack_constant_splat(%dest : tensor<4x8x8x32xf32>) -> tensor<4x8x8x32xf32> {
  %pad = arith.constant 1.000000e-01 : f32
  %cst = arith.constant dense<1.000000e-01> : tensor<63x127xf32>
  %0 = linalg.pack %cst
    padding_value(%pad : f32)
    outer_dims_perm = [1, 0] inner_dims_pos = [0, 1]
    inner_tiles = [8, 32] into %dest : tensor<63x127xf32> -> tensor<4x8x8x32xf32>
  return %0 : tensor<4x8x8x32xf32>
}
