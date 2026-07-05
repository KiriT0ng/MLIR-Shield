func.func @test_transpose_f8E5M2(%arg0: tensor<13x21x3xf8E5M2>) -> tensor<3x13x21xf8E5M2> {
  %1 = tosa.transpose %arg0 {perms = array<i32: 2, 0, 1>} : (tensor<13x21x3xf8E5M2>) -> tensor<3x13x21xf8E5M2>
  return %1 : tensor<3x13x21xf8E5M2>
}
