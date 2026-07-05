func.func @test_concat_f8E4M3FN(%arg0: tensor<13x21x3xf8E4M3FN>, %arg1: tensor<13x21x3xf8E4M3FN>) -> tensor<26x21x3xf8E4M3FN> {
  %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<13x21x3xf8E4M3FN>, tensor<13x21x3xf8E4M3FN>) -> tensor<26x21x3xf8E4M3FN>
  return %0 : tensor<26x21x3xf8E4M3FN>
}
