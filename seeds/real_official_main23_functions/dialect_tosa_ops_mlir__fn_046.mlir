func.func @test_clamp_quantized(%arg0: tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>) -> tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>> {
  %0 = tosa.clamp %arg0 {min_val = 0 : i8, max_val = 1 : i8} : (tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>) -> tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>
  return %0 : tensor<13x21x3x!quant.uniform<i8:f32, 1.000000e-01:-127>>
}
