func.func @test_clamp_f16(%arg0: tensor<1xf16>) -> () {
  %0 = tosa.clamp %arg0 {min_val = 0.0 : f16, max_val = 6.0 : f16} : (tensor<1xf16>) -> tensor<1xf16>

  return
}
