func.func @test_static_fft2d(%arg0: tensor<8x8x8xf32>, %arg1: tensor<8x8x8xf32>) -> (tensor<8x8x8xf32>, tensor<8x8x8xf32>) {
  %output_real, %output_imag = "tosa.fft2d"(%arg0, %arg1) {inverse=false} : (tensor<8x8x8xf32>, tensor<8x8x8xf32>) -> (tensor<8x8x8xf32>, tensor<8x8x8xf32>)
  return %output_real, %output_imag : tensor<8x8x8xf32>, tensor<8x8x8xf32>
}
