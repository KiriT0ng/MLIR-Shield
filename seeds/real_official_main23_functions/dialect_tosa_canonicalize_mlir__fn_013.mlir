func.func @add_zero_int(%arg0: tensor<2x3xi32>) -> tensor<2x3xi32> {
  %zeros = "tosa.const"() {values = dense<0> : tensor<2x3xi32>} : () -> tensor<2x3xi32>
  %1 = tosa.add %arg0, %zeros : (tensor<2x3xi32>, tensor<2x3xi32>) -> tensor<2x3xi32>
  return %1 : tensor<2x3xi32>
}
