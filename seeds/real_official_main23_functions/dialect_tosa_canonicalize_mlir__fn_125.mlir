func.func @test_canonicalize_narrowing_cast_i32_to_i8(%arg0: tensor<13x21x3xi32>) -> tensor<13x21x3xi8> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xi32>) -> tensor<13x21x3xi16>
  %1 = tosa.cast %0 : (tensor<13x21x3xi16>) -> tensor<13x21x3xi8>
  return %1 : tensor<13x21x3xi8>
}
