func.func @test_max_pool2d_f8E5M2(%arg0: tensor<1x32x32x8xf8E5M2>) -> tensor<1x32x32x8xf8E5M2> {
  %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8xf8E5M2>) -> tensor<1x32x32x8xf8E5M2>
  return %0 : tensor<1x32x32x8xf8E5M2>
}
