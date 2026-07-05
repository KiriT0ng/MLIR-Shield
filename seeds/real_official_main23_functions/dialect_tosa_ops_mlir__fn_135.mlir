func.func @test_rescale_i16_zp32768(%arg0 : tensor<2xi8>) -> tensor<2xi16> {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16>} : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8>} : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<17> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<32768> : tensor<1xi16>} : () -> tensor<1xi16>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = true} : (tensor<2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi16>) -> tensor<2xi16>
  return %0 : tensor<2xi16>
}
