func.func @test_clamp_bf16(%arg0: tensor<13x21x3xbf16>) -> tensor<13x21x3xbf16> {
  %0 = tosa.clamp %arg0 {min_val = 0.0 : bf16, max_val = 1.0: bf16} : (tensor<13x21x3xbf16>) -> tensor<13x21x3xbf16>
  return %0 : tensor<13x21x3xbf16>
}
