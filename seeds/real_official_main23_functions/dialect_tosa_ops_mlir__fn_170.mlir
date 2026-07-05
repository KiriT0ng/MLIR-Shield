func.func @test_conv3d_f8E4M3FN(%arg0: tensor<1x4x8x21x17xf8E4M3FN>, %arg1: tensor<34x1x1x1x17xf8E4M3FN>, %arg2: tensor<34xf16>, %arg3: tensor<1xf8E4M3FN>, %arg4: tensor<1xf8E4M3FN>) -> tensor<1x4x8x21x34xf16> {
  %0 = tosa.conv3d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f16, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x4x8x21x17xf8E4M3FN>, tensor<34x1x1x1x17xf8E4M3FN>, tensor<34xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x4x8x21x34xf16>
  return %0 : tensor<1x4x8x21x34xf16>
}
