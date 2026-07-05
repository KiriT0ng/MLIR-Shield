func.func @test_matmul_f8E5M2(%arg0: tensor<1x14x19xf8E5M2>, %arg1: tensor<1x19x28xf8E5M2>) -> tensor<1x14x28xf16> {
  %azp0 = "tosa.const"() <{values = dense<0.0> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
  %bzp0 = "tosa.const"() <{values = dense<0.0> : tensor<1xf8E5M2>}> : () -> tensor<1xf8E5M2>
  %0 = tosa.matmul %arg0, %arg1, %azp0, %bzp0 : (tensor<1x14x19xf8E5M2>, tensor<1x19x28xf8E5M2>, tensor<1xf8E5M2>, tensor<1xf8E5M2>) -> tensor<1x14x28xf16>
  return %0 : tensor<1x14x28xf16>
}
