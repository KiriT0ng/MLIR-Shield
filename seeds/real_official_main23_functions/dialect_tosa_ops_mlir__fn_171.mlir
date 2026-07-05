func.func @test_depthwise_conv2d_f8E4M3FN(%arg0: tensor<1x4x4x4xf8E4M3FN>, %arg1: tensor<1x1x4x2xf8E4M3FN>, %arg2: tensor<8xf16>, %arg3: tensor<1xf8E4M3FN>, %arg4: tensor<1xf8E4M3FN>) -> tensor<1x4x4x8xf16> {
  %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f16, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x4x4x4xf8E4M3FN>, tensor<1x1x4x2xf8E4M3FN>, tensor<8xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x4x4x8xf16>
  return %0 : tensor<1x4x4x8xf16>
}
