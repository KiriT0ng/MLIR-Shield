func.func @mul_quant_nofold() -> tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>> {
   %0 = "tosa.const"() {values = dense<0> : tensor<1xi8>} : () -> tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %1 = "tosa.const"() {values = dense<1> : tensor<1xi8>} : () -> tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %shift = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
   %2 = tosa.mul %0, %1, %shift : (tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>, tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>, tensor<1xi8>) -> tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   return %2 : tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
}
