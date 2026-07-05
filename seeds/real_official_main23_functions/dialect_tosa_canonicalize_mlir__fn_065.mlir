func.func @reshape_canonicalize_const_splat() -> (tensor<10xi32>, tensor<1x10xi32>) {
  %0 = "tosa.const"() {values = dense<0> : tensor<10xi32>} : () -> tensor<10xi32>
  %2 = "tosa.const_shape"() {values = dense<[1, 10]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.reshape %0, %2 : (tensor<10xi32>, !tosa.shape<2>) -> tensor<1x10xi32>
  return %0 , %1 : tensor<10xi32>, tensor<1x10xi32>
}
