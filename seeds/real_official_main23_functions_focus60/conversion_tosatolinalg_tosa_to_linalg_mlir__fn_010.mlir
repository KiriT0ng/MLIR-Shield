func.func @test_add_1d_matching_no_broadcast(%arg0: tensor<1xf32>, %arg1: tensor<1xf32>) -> tensor<1xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  return %0 : tensor<1xf32>
}
