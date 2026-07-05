func.func @greater_equal_quant_fold() -> tensor<i1> {
   %0 = "tosa.const"() {values = dense<0> : tensor<i8>} : () -> tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>
   %2 = "tosa.greater_equal"(%0, %0) : (tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>, tensor<!quant.uniform<i8:f32, 3.0757404601899907E-5:-128>>) -> tensor<i1>
   return %2 : tensor<i1>
}
