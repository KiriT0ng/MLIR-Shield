func.func @negative_infer_unpack_shape(%arg1: tensor<32x7x?x16x1xf32>, %arg2: index) -> tensor<?x32x100xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty(%arg2) : tensor<?x32x100xf32>
  %unpack = linalg.unpack %arg1 outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 0] inner_tiles = [16, 1] into %0 : tensor<32x7x?x16x1xf32> -> tensor<?x32x100xf32>
  return %unpack : tensor<?x32x100xf32>
}
