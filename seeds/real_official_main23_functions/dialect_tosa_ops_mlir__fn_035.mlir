func.func @test_rfft2d_with_local_bound(%arg0: tensor<13x8x16xf32>) -> (tensor<13x8x9xf32>, tensor<13x8x9xf32>) {
  %0, %1 = tosa.rfft2d %arg0 {local_bound = true} : (tensor<13x8x16xf32>) -> (tensor<13x8x9xf32>, tensor<13x8x9xf32>)
  return %0, %1 : tensor<13x8x9xf32>, tensor<13x8x9xf32>
}
