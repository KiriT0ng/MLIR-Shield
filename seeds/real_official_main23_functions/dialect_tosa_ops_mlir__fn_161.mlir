func.func @test_reverse_f8E5M2(%arg0: tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf8E5M2> {
  %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf8E5M2>
  return %0 : tensor<13x21x3xf8E5M2>
}
