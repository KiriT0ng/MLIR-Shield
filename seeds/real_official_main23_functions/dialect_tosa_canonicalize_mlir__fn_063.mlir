func.func @reshape_canonicalize_const() -> tensor<1x5xi32> {
  %0 = "tosa.const"() {values = dense<[0, 1, 2, 3, 4]> : tensor<5xi32>} : () -> tensor<5xi32>
  %1 = "tosa.const_shape"() {values = dense<[1, 5]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %2 = tosa.reshape %0, %1 : (tensor<5xi32>, !tosa.shape<2>) -> tensor<1x5xi32>
  return %2 : tensor<1x5xi32>
}
