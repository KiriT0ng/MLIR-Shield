func.func @test_transpose_half_dynamic_dim(%arg0: tensor<13x3x3xf32>) -> tensor<3x13x?xf32> {
  %1 = tosa.transpose %arg0 {perms = array<i32: 2, 0, 1>} : (tensor<13x3x3xf32>) -> tensor<3x13x?xf32>
  return %1 : tensor<3x13x?xf32>
}
