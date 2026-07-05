func.func @test_avg_pool2d_i16(%arg0: tensor<1x7x7x9xi16>) -> tensor<1x7x7x9xi16> {
  %input_zp = "tosa.const"() <{values = dense<0> : tensor<1xi16>}> : () -> tensor<1xi16>
  %output_zp = "tosa.const"() <{values = dense<0> : tensor<1xi16>}> : () -> tensor<1xi16>
  %0 = tosa.avg_pool2d %arg0, %input_zp, %output_zp {acc_type = i32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x7x7x9xi16>, tensor<1xi16>, tensor<1xi16>) -> tensor<1x7x7x9xi16>
  return %0 : tensor<1x7x7x9xi16>
}
