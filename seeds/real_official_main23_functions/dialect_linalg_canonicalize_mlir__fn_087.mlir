func.func @pack_dont_drop_attributes(%arg0: tensor<?x?x?xf16>, %arg1: tensor<128x?x100x16x1xf16>) -> tensor<128x?x100x16x1xf16> {
  %c32_i64 = arith.constant 32 : i64
  %cst = arith.constant 0.000000e+00 : f16
  %pack = linalg.pack %arg0 padding_value(%cst : f16) outer_dims_perm = [0, 1, 2] inner_dims_pos = [1, 2] inner_tiles = [16, 1] into %arg1 {test_attr} : tensor<?x?x?xf16> -> tensor<128x?x100x16x1xf16>
  return %pack : tensor<128x?x100x16x1xf16>
}
