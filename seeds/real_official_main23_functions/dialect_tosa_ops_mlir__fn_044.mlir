func.func @test_clamp_f16(%arg0: tensor<13x21x3xf16>) -> tensor<13x21x3xf16> {
  %0 = tosa.clamp %arg0 {min_val = 0.0 : f16, max_val = 1.0: f16} : (tensor<13x21x3xf16>) -> tensor<13x21x3xf16>
  return %0 : tensor<13x21x3xf16>
}
