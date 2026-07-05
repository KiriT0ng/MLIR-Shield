func.func @test_mul_scalar(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
  %shift = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.mul %arg0, %arg1, %shift : (tensor<f32>, tensor<f32>, tensor<1xi8>) -> tensor<f32>
  return %0 : tensor<f32>
}
