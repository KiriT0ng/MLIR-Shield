func.func @reshape_canonicalize_const_sparse() -> (tensor<3xi32>, tensor<1x3xi32>) {
  %0 = "tosa.const"() {values = dense<[1, 2, 3]> : tensor<3xi32>} : ()-> tensor<3xi32>
  %2 = "tosa.const_shape"() {values = dense<[1, 3]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.reshape %0, %2 : (tensor<3xi32>, !tosa.shape<2>) -> tensor<1x3xi32>
  return %0 , %1 : tensor<3xi32>, tensor<1x3xi32>
}
