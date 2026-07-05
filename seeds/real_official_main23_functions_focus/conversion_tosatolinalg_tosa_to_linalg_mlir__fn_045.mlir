func.func @rescale_per_channel(%arg0 : tensor<3xi8>) -> (tensor<3xi8>) {

  %multiplier = "tosa.const"() {values = dense<[42, 43, 44]> : tensor<3xi16>} : () -> tensor<3xi16>
  %shift = "tosa.const"() {values = dense<[14, 15, 64]> : tensor<3xi8>} : () -> tensor<3xi8>
  %input_zp = "tosa.const"() {values = dense<43> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<52> : tensor<1xi8>} : () -> tensor<1xi8>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = true, input_unsigned = false, output_unsigned = false} : (tensor<3xi8>, tensor<3xi16>, tensor<3xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<3xi8>

  return %0 : tensor<3xi8>
}
