func.func @fold_pack_constant_splat(%dest : tensor<4x8x8x32xf32>) -> tensor<4x8x8x32xf32> {
  %cst = arith.constant dense<1.000000e-01> : tensor<64x128xf32>
  %0 = linalg.pack %cst outer_dims_perm = [1, 0] inner_dims_pos = [0, 1]
    inner_tiles = [8, 32] into %dest : tensor<64x128xf32> -> tensor<4x8x8x32xf32>
  return %0 : tensor<4x8x8x32xf32>
}
