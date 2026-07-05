func.func @reshape_canonicalize_const_dynamic() -> tensor<1x?xi32> {
  %0 = "tosa.const"() {values = dense<[0, 1, 2, 3, 4]> : tensor<5xi32>} : () -> tensor<5xi32>
  %2 = "tosa.const_shape"() {values = dense<[1, 5]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.reshape %0, %2 : (tensor<5xi32>, !tosa.shape<2>) -> tensor<1x?xi32>
  return %1 : tensor<1x?xi32>
}
