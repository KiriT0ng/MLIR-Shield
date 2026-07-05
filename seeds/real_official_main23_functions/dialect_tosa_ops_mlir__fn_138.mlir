func.func @test_identity(%arg0: tensor<13x21x3xi32>) -> tensor<13x21x3xi32> {
  %0 = tosa.identity %arg0 : (tensor<13x21x3xi32>) -> tensor<13x21x3xi32>
  return %0 : tensor<13x21x3xi32>
}
