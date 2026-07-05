func.func @pad_wh_max_pool2d_no_fold_8k_limit(%input: tensor<1x10x8x3xf32>) -> tensor<1x6x4101x3xf32> {
  %pad_shape = tosa.const_shape { values = dense<[0, 0, 1, 0, 8193, 0, 0, 0]> : tensor<8xindex>} : () -> !tosa.shape<8>
  %pad_const = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : ()-> tensor<1xf32>
  %padded = tosa.pad %input, %pad_shape, %pad_const : (tensor<1x10x8x3xf32>, !tosa.shape<8>, tensor<1xf32>) -> tensor<1x11x8201x3xf32>
  %pool = tosa.max_pool2d %padded {kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 2, 2>} : (tensor<1x11x8201x3xf32>) -> tensor<1x6x4101x3xf32>
  return %pool : tensor<1x6x4101x3xf32>
}
