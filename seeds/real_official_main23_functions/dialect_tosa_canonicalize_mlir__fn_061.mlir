func.func @reshape_canonicalize_dyn_nofold(%arg0: tensor<?x?x10xf32>) -> tensor<?x?x10xf32> {
  %s = "tosa.const_shape"() {values = dense<[-1, 2, 10]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %0 = tosa.reshape %arg0, %s : (tensor<?x?x10xf32>, !tosa.shape<3>) -> tensor<?x?x10xf32>
  return %0 : tensor<?x?x10xf32>
}
