func.func @reshape_quant_nofold() -> tensor<1x1x1x1xi32> {
   %0 = "tosa.const"() {values = dense<127> : tensor<i8>} : () -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %cst0 = "tosa.const_shape"() {values = dense<[1, 1, 1, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
   %1 = tosa.reshape %0, %cst0 : (tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>, !tosa.shape<4>) -> tensor<1x1x1x1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %multiplier = "tosa.const"() {values = dense<1073741824> : tensor<1xi32> } : () -> tensor<1xi32>
   %shift = "tosa.const"() {values = dense<30> : tensor<1xi8> } : () -> tensor<1xi8>
   %input_zp = "tosa.const"() {values = dense<-128> : tensor<1xi8>} : () -> tensor<1xi8>
   %output_zp = "tosa.const"() {values = dense<0> : tensor<1xi32>} : () -> tensor<1xi32>
   %2 = tosa.rescale %1, %multiplier, %shift, %input_zp, %output_zp {rounding_mode = DOUBLE_ROUND, scale32 = true, per_channel = false, input_unsigned = false, output_unsigned = false} : (tensor<1x1x1x1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi32>) -> tensor<1x1x1x1xi32>
   return %2 : tensor<1x1x1x1xi32>
}
