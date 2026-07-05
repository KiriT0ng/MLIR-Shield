func.func @test_canonicalize_narrowing_cast_i8_to_ui16_to_i8(%arg0: tensor<13x21x3xi8>) -> tensor<13x21x3xi8> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xi8>) -> tensor<13x21x3xui16>
  %1 = tosa.cast %0 : (tensor<13x21x3xui16>) -> tensor<13x21x3xi8>
  return %1 : tensor<13x21x3xi8>
}
