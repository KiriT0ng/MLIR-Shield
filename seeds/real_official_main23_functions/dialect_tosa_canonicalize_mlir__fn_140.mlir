func.func @test_canonicalize_non_narrowing_cast_f16_to_bf16_unsupported(%arg0: tensor<13x21x3xf16>) -> tensor<13x21x3xbf16> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xf16>) -> tensor<13x21x3xf32>
  %1 = tosa.cast %0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xbf16>
  return %1 : tensor<13x21x3xbf16>
}
