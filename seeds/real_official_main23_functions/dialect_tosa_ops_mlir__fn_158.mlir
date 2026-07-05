func.func @test_concat_f8E5M2(%arg0: tensor<13x21x3xf8E5M2>, %arg1: tensor<13x21x3xf8E5M2>) -> tensor<26x21x3xf8E5M2> {
  %0 = tosa.concat %arg0, %arg1 {axis = 0 : i32} : (tensor<13x21x3xf8E5M2>, tensor<13x21x3xf8E5M2>) -> tensor<26x21x3xf8E5M2>
  return %0 : tensor<26x21x3xf8E5M2>
}
