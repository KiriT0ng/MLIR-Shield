func.func @reverse_quant_fold() -> tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>> {
   %0 = "tosa.const"() {values = dense<0> : tensor<1xi8>} : () -> tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %1 = "tosa.reverse"(%0) { axis = 0 : i32 } : (tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>) -> tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   return %1 : tensor<1x!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
}
