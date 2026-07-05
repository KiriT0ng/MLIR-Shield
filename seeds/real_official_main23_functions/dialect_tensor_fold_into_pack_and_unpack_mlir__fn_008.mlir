func.func @nofold_pad_pack_artificial_padding(%src: tensor<9x16xf32>) -> tensor<3x1x8x32xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %padded = tensor.pad %src low[0, 0] high[8, 0] {
  ^bb0(%arg0: index, %arg1: index):
    tensor.yield %cst : f32
  } : tensor<9x16xf32> to tensor<17x16xf32>
  %empty = tensor.empty() : tensor<3x1x8x32xf32>
  %pack = linalg.pack %padded padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %empty
      : tensor<17x16xf32> -> tensor<3x1x8x32xf32>
  return %pack : tensor<3x1x8x32xf32>
}
