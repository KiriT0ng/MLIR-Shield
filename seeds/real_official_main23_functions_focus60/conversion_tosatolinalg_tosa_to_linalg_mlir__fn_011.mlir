func.func @test_add_1d_matching_static(%arg0: tensor<3xf32>, %arg1: tensor<3xf32>) -> tensor<3xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<3xf32>, tensor<3xf32>) -> tensor<3xf32>

  return %0 : tensor<3xf32>
}
