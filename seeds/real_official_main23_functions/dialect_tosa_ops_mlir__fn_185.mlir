func.func @test_scatter_f8E4M3FN(%arg0: tensor<13x29x3xf8E4M3FN>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xf8E4M3FN>) -> tensor<13x29x3xf8E4M3FN> {
  %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x29x3xf8E4M3FN>, tensor<13x26xi32>, tensor<13x26x3xf8E4M3FN>) -> tensor<13x29x3xf8E4M3FN>
  return %0 : tensor<13x29x3xf8E4M3FN>
}
