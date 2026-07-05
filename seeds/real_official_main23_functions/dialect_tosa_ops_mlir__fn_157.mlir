func.func @test_cast_f8E5M2(%arg0: tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf16> {
  %0 = tosa.cast %arg0 : (tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf16>
  return %0 : tensor<13x21x3xf16>
}
