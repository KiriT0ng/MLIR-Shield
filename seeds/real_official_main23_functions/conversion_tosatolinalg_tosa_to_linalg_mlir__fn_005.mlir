func.func @test_add_2d_broadcast(%arg0: tensor<2x1xf32>, %arg1: tensor<1x1xf32>) -> tensor<2x1xf32> {
  // tosa element-wise operators now require operands of equal ranks
  %0 = tosa.add %arg0, %arg1 : (tensor<2x1xf32>, tensor<1x1xf32>) -> tensor<2x1xf32>
  return %0 : tensor<2x1xf32>
}
