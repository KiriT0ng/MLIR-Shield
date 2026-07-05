func.func @test_canonicalize_non_narrowing_cast_i1_to_f32_unsupported(%arg0: tensor<13x21x3xi1>) -> tensor<13x21x3xf32> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xi1>) -> tensor<13x21x3xi8>
  %1 = tosa.cast %0 : (tensor<13x21x3xi8>) -> tensor<13x21x3xf32>
  return %1 : tensor<13x21x3xf32>
}
