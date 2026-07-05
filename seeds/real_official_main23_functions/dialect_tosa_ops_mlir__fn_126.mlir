func.func @test_scatter_unranked_indices(%arg0: tensor<13x21x3xf32>, %arg1: tensor<*xi32>, %arg2: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
  %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x21x3xf32>, tensor<*xi32>, tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
  return %0 : tensor<13x21x3xf32>
}
