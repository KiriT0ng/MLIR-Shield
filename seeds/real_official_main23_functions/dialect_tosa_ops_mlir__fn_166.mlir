func.func @test_scatter_f8E5M2(%arg0: tensor<13x52x3xf8E5M2>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xf8E5M2>) -> tensor<13x52x3xf8E5M2> {
  %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x52x3xf8E5M2>, tensor<13x26xi32>, tensor<13x26x3xf8E5M2>) -> tensor<13x52x3xf8E5M2>
  return %0 : tensor<13x52x3xf8E5M2>
}
