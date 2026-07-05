func.func @cast_quant_nofold() -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:3>> {
   %0 = "tosa.const"() {values = dense<0> : tensor<i8>} : () -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %1 = "tosa.cast"(%0) : (tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>) -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:3>>
   return %1 : tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:3>>
}
