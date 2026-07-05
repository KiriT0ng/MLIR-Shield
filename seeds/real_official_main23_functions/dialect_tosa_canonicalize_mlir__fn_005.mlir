func.func @pad_wh_conv2d_fold(%input: tensor<1x8x4x3xf32>, %weight: tensor<1x3x3x3xf32>, %bias: tensor<1xf32>) -> tensor<1x10x8x1xf32> {
  %pad_shape = tosa.const_shape { values = dense<[0, 0, 1, 1, 2, 2, 0, 0]> : tensor<8xindex>} : () -> !tosa.shape<8>
  %pad_const = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : ()-> tensor<1xf32>
  %input_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : ()-> tensor<1xf32>
  %weight_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : ()-> tensor<1xf32>
  %padded = tosa.pad %input, %pad_shape, %pad_const : (tensor<1x8x4x3xf32>, !tosa.shape<8>, tensor<1xf32>) -> tensor<1x10x8x3xf32>
  %conv = tosa.conv2d %padded, %weight, %bias, %input_zp, %weight_zp {acc_type = f32, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>, dilation = array<i64: 1, 1>} : (tensor<1x10x8x3xf32>, tensor<1x3x3x3xf32>, tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x10x8x1xf32>
  return %conv : tensor<1x10x8x1xf32>
}
