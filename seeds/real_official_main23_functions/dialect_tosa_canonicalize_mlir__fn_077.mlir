func.func @transpose_is_reshape(%arg0: tensor<1x4x5x1xf32>) -> tensor<1x4x1x5xf32> {
  %0 = tosa.transpose %arg0 { perms = array<i32: 3, 1, 0, 2> }: (tensor<1x4x5x1xf32>) -> tensor<1x4x1x5xf32>
  return %0 : tensor<1x4x1x5xf32>
}
