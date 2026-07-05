func.func @test_canonicalize_non_narrowing_cast_f8E4M3FN_to_f16_to_f8E5M2(%arg0: tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf8E5M2> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf16>
  %1 = tosa.cast %0 : (tensor<13x21x3xf16>) -> tensor<13x21x3xf8E5M2>
  return %1 : tensor<13x21x3xf8E5M2>
}
