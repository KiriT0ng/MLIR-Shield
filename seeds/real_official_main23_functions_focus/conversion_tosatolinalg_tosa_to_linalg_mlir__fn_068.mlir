func.func @test_static_rfft2d(%arg0: tensor<5x4x8xf32>) -> (tensor<5x4x5xf32>, tensor<5x4x5xf32>) {
  %output_real, %output_imag = "tosa.rfft2d"(%arg0) {} : (tensor<5x4x8xf32>) -> (tensor<5x4x5xf32>, tensor<5x4x5xf32>)
  return %output_real, %output_imag : tensor<5x4x5xf32>, tensor<5x4x5xf32>
}
