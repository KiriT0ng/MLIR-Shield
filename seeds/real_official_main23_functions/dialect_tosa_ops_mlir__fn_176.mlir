func.func @test_cast_f8E4M3FN(%arg0: tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf16> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf16>
  return %0 : tensor<13x21x3xf16>
}
