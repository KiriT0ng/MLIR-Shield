func.func @select_quant_fold() -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>> {
   %0 = "tosa.const"() {values = dense<true> : tensor<i1>} : () -> tensor<i1>
   %1 = "tosa.const"() {values = dense<0> : tensor<i8>} : () -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %2 = "tosa.const"() {values = dense<127> : tensor<i8>} : () -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %3 = "tosa.select"(%0, %1, %2) : (tensor<i1>, tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>, tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>) -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   return %3 : tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
}
