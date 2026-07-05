func.func @test_simple_i16(%arg0: tensor<1xi16>) -> () {
  %shift = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.mul %arg0, %arg0, %shift : (tensor<1xi16>, tensor<1xi16>, tensor<1xi8>) -> tensor<1xi32>

  return
}
