func.func @test_rfft2d_width1(%arg0: tensor<1x1x1xf32>) -> (tensor<1x1x1xf32>, tensor<1x1x1xf32>) {
  %0, %1 = tosa.rfft2d %arg0 : (tensor<1x1x1xf32>) -> (tensor<1x1x1xf32>, tensor<1x1x1xf32>)
  return %0, %1 : tensor<1x1x1xf32>, tensor<1x1x1xf32>
}
