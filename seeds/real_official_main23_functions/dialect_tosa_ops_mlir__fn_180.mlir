func.func @test_reverse_f8E4M3FN(%arg0: tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf8E4M3FN> {
  %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf8E4M3FN>
  return %0 : tensor<13x21x3xf8E4M3FN>
}
