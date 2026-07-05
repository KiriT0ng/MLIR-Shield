func.func @test_mul_relaxed_result_type(%arg0: tensor<13x21x3xi16>, %arg1: tensor<13x1x3xi16>) -> tensor<13x21x3xi16> {
  %shift = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.mul %arg0, %arg1, %shift : (tensor<13x21x3xi16>, tensor<13x1x3xi16>, tensor<1xi8>) -> tensor<13x21x3xi16>
  return %0 : tensor<13x21x3xi16>
}
