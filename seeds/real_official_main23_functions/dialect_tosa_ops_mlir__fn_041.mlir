func.func @test_clamp_propagate(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
  %0 = tosa.clamp %arg0 {min_val = 0.0 : f32, max_val = 1.0: f32, nan_mode = PROPAGATE} : (tensor<13x21x3xf32>) -> tensor<13x21x3xf32>
  return %0 : tensor<13x21x3xf32>
}
