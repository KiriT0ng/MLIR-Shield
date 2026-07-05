func.func @test_canonicalize_non_narrowing_cast_i8_to_i64_unsupported(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xi64> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xi8>) -> tensor<13x21x3xi32>
  %1 = tosa.cast %0 : (tensor<13x21x3xi32>) -> tensor<13x21x3xi64>
  return %1 : tensor<13x21x3xi64>
}
