func.func @nofold_pad_pack_with_nofold_attribute(%src: tensor<16649x16xf32>) -> tensor<2082x1x8x32xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %padded = tensor.pad %src nofold low[0, 0] high[7, 0] {
  ^bb0(%arg0: index, %arg1: index):
    tensor.yield %cst : f32
  } : tensor<16649x16xf32> to tensor<16656x16xf32>
  %empty = tensor.empty() : tensor<2082x1x8x32xf32>
  %pack = linalg.pack %padded padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %empty
      : tensor<16656x16xf32> -> tensor<2082x1x8x32xf32>
  return %pack : tensor<2082x1x8x32xf32>
}
