func.func @test_cast2(%arg0: tensor<13x21x3xi32>) -> tensor<13x21x3x!quant.uniform<u8:f32, 0.078431375324726104:128>> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xi32>) -> tensor<13x21x3x!quant.uniform<u8:f32, 0.078431375324726104:128>>
  return %0 : tensor<13x21x3x!quant.uniform<u8:f32, 0.078431375324726104:128>>
}
