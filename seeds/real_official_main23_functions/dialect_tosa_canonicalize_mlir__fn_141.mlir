func.func @test_canonicalize_non_narrowing_cast_i8_to_f8E4M3FN_unsupported(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xf8E4M3FN> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xi8>) -> tensor<13x21x3xf32>
  %1 = tosa.cast %0 : (tensor<13x21x3xf32>) -> tensor<13x21x3xf8E4M3FN>
  return %1 : tensor<13x21x3xf8E4M3FN>
}
