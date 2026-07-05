func.func @test_canonicalize_non_narrowing_cast_f16_to_f32_to_f8(%arg0: tensor<13x21x3xf16>) -> tensor<13x21x3xf8E5M2> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xf16>) -> tensor<13x21x3xf32>
  %1 = tosa.cast %0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf8E5M2>
  return %1 : tensor<13x21x3xf8E5M2>
}
