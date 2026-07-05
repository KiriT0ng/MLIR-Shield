func.func @test_transpose_f8E4M3FN(%arg0: tensor<13x21x3xf8E4M3FN>) -> tensor<3x13x21xf8E4M3FN> {
  %1 = tosa.transpose %arg0 {perms = array<i32: 2, 0, 1>} : (tensor<13x21x3xf8E4M3FN>) -> tensor<3x13x21xf8E4M3FN>
  return %1 : tensor<3x13x21xf8E4M3FN>
}
