func.func @transpose_no_op(%arg0: tensor<3x4x5x6xf32>) -> tensor<3x4x5x6xf32> {
  %1 = tosa.transpose %arg0 { perms = array<i32: 0, 1, 2, 3> }: (tensor<3x4x5x6xf32>) -> tensor<3x4x5x6xf32>
  return %1 : tensor<3x4x5x6xf32>
}
