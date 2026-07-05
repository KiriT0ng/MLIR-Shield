func.func @test_identity(%arg0: tensor<1xf32>, %arg1: tensor<1xi32>) -> (tensor<1xf32>, tensor<1xi32>) {
  %0 = tosa.identity %arg0 : (tensor<1xf32>) -> tensor<1xf32>
  %1 = tosa.identity %arg1 : (tensor<1xi32>) -> tensor<1xi32>

  return %0, %1 : tensor<1xf32>, tensor<1xi32>
}
