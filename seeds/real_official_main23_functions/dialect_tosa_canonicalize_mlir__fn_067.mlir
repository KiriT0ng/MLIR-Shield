func.func @reshape_canonicalize_quant_nofold() -> (tensor<1x3x!quant.uniform<i8:f32, 1.000000e+00>>) {
  // disabled folding for quantized element types
  // CHECK{LITERAL}: "tosa.const"() <{values = dense<[1, 2, 3]> : tensor<3xi8>}> : () -> tensor<3x!quant.uniform<i8:f32, 1.000000e+00>>
  // CHECK{LITERAL}: tosa.reshape %0, %1 : (tensor<3x!quant.uniform<i8:f32, 1.000000e+00>>, !tosa.shape<2>) -> tensor<1x3x!quant.uniform<i8:f32, 1.000000e+00>>
  %0 = "tosa.const"() {values = dense<[1, 2, 3]> : tensor<3xi8>} : ()-> tensor<3x!quant.uniform<i8:f32, 1.000000e+00>>
  %2 = "tosa.const_shape"() {values = dense<[1, 3]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.reshape %0, %2 : (tensor<3x!quant.uniform<i8:f32, 1.000000e+00>>, !tosa.shape<2>) -> tensor<1x3x!quant.uniform<i8:f32, 1.000000e+00>>
  return %1 :  tensor<1x3x!quant.uniform<i8:f32, 1.000000e+00>>
}
