func.func @test_avg_pool2d_f8E5M2(%arg0: tensor<1x7x7x9xf8E5M2>) -> tensor<1x7x7x9xf8E5M2> {
  %input_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
  %output_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
  %0 = tosa.avg_pool2d %arg0, %input_zp, %output_zp {acc_type = f16, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x7x7x9xf8E5M2>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x7x7x9xf8E5M2>
  return %0 : tensor<1x7x7x9xf8E5M2>
}
