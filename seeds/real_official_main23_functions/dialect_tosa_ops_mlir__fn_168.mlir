func.func @test_avg_pool2d_f8E4M3FN(%arg0: tensor<1x7x7x9xf8E4M3FN>) -> tensor<1x7x7x9xf8E4M3FN> {
  %input_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
  %output_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf8E4M3FN>}> : () -> tensor<1xf8E4M3FN>
  %0 = tosa.avg_pool2d %arg0, %input_zp, %output_zp {acc_type = f16, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x7x7x9xf8E4M3FN>, tensor<1xf8E4M3FN>, tensor<1xf8E4M3FN>) -> tensor<1x7x7x9xf8E4M3FN>
  return %0 : tensor<1x7x7x9xf8E4M3FN>
}
