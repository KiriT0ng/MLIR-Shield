func.func nested @do_not_fold_reciprocal_int() -> tensor<3x600x1200xi32> {
  %0 = "tosa.const"(){ values = dense<11>: tensor<3x600x1200xi32> }: () -> tensor<3x600x1200xi32>
  %1 = "tosa.reciprocal"(%0): (tensor<3x600x1200xi32>) -> tensor<3x600x1200xi32>
  return %1 : tensor<3x600x1200xi32>
}
