func.func nested @fold_reciprocal() -> tensor<3x600x1200xf32> {
  %0 = "tosa.const"(){ values = dense<116.0>: tensor<3x600x1200xf32> }: () -> tensor<3x600x1200xf32>
  %1 = "tosa.reciprocal"(%0): (tensor<3x600x1200xf32>) -> tensor<3x600x1200xf32>
  return %1 : tensor<3x600x1200xf32>
}
