func.func @test_transpose_conv2d_f8E4M3FN(%arg0: tensor<1x32x32x8xf8E4M3FN>, %arg1: tensor<16x1x1x8xf8E4M3FN>, %arg2: tensor<16xf16>, %arg3: tensor<1xf8E4M3FN>, %arg4: tensor<1xf8E4M3FN>) -> tensor<1x32x32x16xf16> {
  %0 = tosa.transpose_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = f16, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf8E4M3FN>, tensor<16x1x1x8xf8E4M3FN>, tensor<16xf16>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x32x32x16xf16>
  return %0 : tensor<1x32x32x16xf16>
}
