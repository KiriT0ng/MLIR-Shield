func.func @add_quant_nofold() -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>> {
   %0 = "tosa.const"() {values = dense<127> : tensor<i8>} : () -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %1 = tosa.add %0, %0 : (tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>, tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>) -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   return %1 : tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
}
