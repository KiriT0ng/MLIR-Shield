func.func @transpose_canonicalize_strip_quant() -> (tensor<2x1x3x!quant.uniform<i8:f32, 1.000000e+00>>) {
  %0 = "tosa.const"() {values = dense<0> : tensor<1x2x3xi8>} : ()-> tensor<1x2x3x!quant.uniform<i8:f32, 1.000000e+00>>
  %1 = tosa.transpose %0 { perms = array<i32: 1, 0, 2> }: (tensor<1x2x3x!quant.uniform<i8:f32, 1.000000e+00>>) -> tensor<2x1x3x!quant.uniform<i8:f32, 1.000000e+00>>
  return %1 :  tensor<2x1x3x!quant.uniform<i8:f32, 1.000000e+00>>
}
