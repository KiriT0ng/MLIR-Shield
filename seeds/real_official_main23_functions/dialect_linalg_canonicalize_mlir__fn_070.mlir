func.func @fold_unpack_constant_splat(%dest : tensor<128x256xf32>) -> tensor<128x256xf32> {
  %cst = arith.constant dense<1.000000e-01> : tensor<16x8x8x32xf32>
  %0 = linalg.unpack %cst inner_dims_pos = [0, 1]
    inner_tiles = [8, 32] into %dest : tensor<16x8x8x32xf32> -> tensor<128x256xf32>
  return %0 : tensor<128x256xf32>
}
