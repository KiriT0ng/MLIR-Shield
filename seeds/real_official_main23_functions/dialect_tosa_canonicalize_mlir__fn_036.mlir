func.func @conv2d_stride_2(%arg0: tensor<4x11x11x2xf32>) -> tensor<4x6x6x3xf32> {
  %weight = "tosa.const"() {values = dense<[[[[1.0, 1.0]]], [[[1.0, 1.0]]], [[[1.0, 1.0]]]]> : tensor<3x1x1x2xf32>} : ()-> tensor<3x1x1x2xf32>
  %bias = "tosa.const"() {values = dense<0.0> : tensor<3xf32>} : ()-> tensor<3xf32>
  %input_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : ()-> tensor<1xf32>
  %weight_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : ()-> tensor<1xf32>
  %0 = tosa.conv2d %arg0, %weight, %bias, %input_zp, %weight_zp {acc_type = f32, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 2>, dilation = array<i64: 1, 1>} : (tensor<4x11x11x2xf32>, tensor<3x1x1x2xf32>, tensor<3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<4x6x6x3xf32>
  return %0 : tensor<4x6x6x3xf32>
}
