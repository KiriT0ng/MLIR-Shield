func.func @depthwise_conv2d_stride_2(%arg0: tensor<4x11x11x2xf32>, %arg1: tensor<1x1x2x3xf32>, %arg2: tensor<6xf32>, %arg3: tensor<1xf32>, %arg4: tensor<1xf32>) -> tensor<4x6x6x6xf32> {
  %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f32, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 2>, dilation = array<i64: 1, 1>} : (tensor<4x11x11x2xf32>, tensor<1x1x2x3xf32>, tensor<6xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<4x6x6x6xf32>
  return %0 : tensor<4x6x6x6xf32>
}
