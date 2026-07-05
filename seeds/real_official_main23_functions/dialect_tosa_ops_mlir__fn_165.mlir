func.func @test_gather_f8E5M2(%arg0: tensor<13x21x3xf8E5M2>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xf8E5M2> {
  %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xf8E5M2>, tensor<13x26xi32>) -> tensor<13x26x3xf8E5M2>
  return %0 : tensor<13x26x3xf8E5M2>
}
