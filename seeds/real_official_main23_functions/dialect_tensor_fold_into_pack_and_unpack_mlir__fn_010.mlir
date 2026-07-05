func.func @pad_pack_different_padding_value(%src: tensor<16641x16xf32>) -> tensor<2082x1x8x32xf32> {
  %cst0 = arith.constant 0.000000e+00 : f32
  %cst1 = arith.constant 1.000000e+00 : f32
  %padded = tensor.pad %src low[0, 0] high[15, 0] {
  ^bb0(%arg0: index, %arg1: index):
    tensor.yield %cst0 : f32
  } : tensor<16641x16xf32> to tensor<16656x16xf32>
  %empty = tensor.empty() : tensor<2082x1x8x32xf32>
  %pack = linalg.pack %padded padding_value(%cst1 : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %empty
      : tensor<16656x16xf32> -> tensor<2082x1x8x32xf32>
  return %pack : tensor<2082x1x8x32xf32>
}
