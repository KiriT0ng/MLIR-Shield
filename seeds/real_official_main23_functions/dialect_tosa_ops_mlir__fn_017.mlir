func.func @test_conv2d_q8xi4(%arg0: tensor<1x11x11x3xi8>) -> tensor<1x1x1x3xi8> {
  %0 = "tosa.const"() {values = dense<0> : tensor<3x11x11x3xi4>} : () -> tensor<3x11x11x3xi4>
  %1 = "tosa.const"() {values = dense<[12, 23, 55]> : tensor<3xi32>} : () -> tensor<3xi32>
  %izp = "tosa.const"() {values = dense<0> : tensor<1xi8>} : () -> tensor<1xi8>
  %wzp = "tosa.const"() {values = dense<0> : tensor<1xi4>} : () -> tensor<1xi4>
  %2 = "tosa.conv2d"(%arg0, %0, %1, %izp, %wzp) {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x11x11x3xi8>, tensor<3x11x11x3xi4>, tensor<3xi32>, tensor<1xi8>, tensor<1xi4>) -> tensor<1x1x1x3xi32>
  %multiplier = "tosa.const"() {values = dense<[2026291432, 1079222024, 1693132724]> : tensor<3xi32>} : () -> tensor<3xi32>
  %shift = "tosa.const"() {values = dense<[37, 36, 37]> : tensor<3xi8>} : () -> tensor<3xi8>
  %rescale_input_zp = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
  %rescale_output_zp = "tosa.const"() <{values = dense<27> : tensor<1xi8>}> : () -> tensor<1xi8>
  %3 = tosa.rescale %2, %multiplier, %shift, %rescale_input_zp, %rescale_output_zp {rounding_mode = DOUBLE_ROUND, scale32 = true, per_channel = true, input_unsigned = false, output_unsigned = false} : (tensor<1x1x1x3xi32>, tensor<3xi32>, tensor<3xi8>, tensor<1xi32>, tensor<1xi8>) -> tensor<1x1x1x3xi8>
  return %3 : tensor<1x1x1x3xi8>
}
