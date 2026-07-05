func.func @test_negate(%arg0: tensor<13x21x3xf32>, %arg1: tensor<1xf32>, %arg2: tensor<1xf32>) -> tensor<13x21x3xf32> {
  %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<13x21x3xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<13x21x3xf32>
  return %0 : tensor<13x21x3xf32>
}
