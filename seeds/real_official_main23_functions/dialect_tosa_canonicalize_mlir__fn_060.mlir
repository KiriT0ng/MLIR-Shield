func.func @reshape_canonicalize(%arg0: tensor<?x10xf32>) -> tensor<?x10xf32> {
  %0 = "tosa.const_shape"() {values = dense<[-1, 10]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.reshape %arg0, %0 : (tensor<?x10xf32>, !tosa.shape<2>) -> tensor<?x10xf32>
  return %1 : tensor<?x10xf32>
}
