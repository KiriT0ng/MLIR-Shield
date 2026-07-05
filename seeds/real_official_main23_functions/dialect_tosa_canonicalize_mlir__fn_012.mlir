func.func @add_bcast_zero_int(%arg0: tensor<4x2x3xi32>) -> tensor<4x2x3xi32> {
  %zeros = "tosa.const"() {values = dense<0> : tensor<1x1x1xi32>} : () -> tensor<1x1x1xi32>
  %1 = tosa.add %arg0, %zeros : (tensor<4x2x3xi32>, tensor<1x1x1xi32>) -> tensor<4x2x3xi32>
  return %1 : tensor<4x2x3xi32>
}
