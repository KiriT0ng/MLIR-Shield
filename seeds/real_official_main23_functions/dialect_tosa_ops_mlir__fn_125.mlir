func.func @test_scatter_int64(%arg0: tensor<13x52x3xf32>, %arg1: tensor<13x26xi64>, %arg2: tensor<13x26x3xf32>) -> tensor<13x52x3xf32> {
  %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x52x3xf32>, tensor<13x26xi64>, tensor<13x26x3xf32>) -> tensor<13x52x3xf32>
  return %0 : tensor<13x52x3xf32>
}
