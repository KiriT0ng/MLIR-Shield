func.func @pad_noop_type_mismatch_nofold(%arg0: tensor<10xf32>) -> tensor<?xf32> {
  %shape = tosa.const_shape { values = dense<[1, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %pad_const = "tosa.const"() {values = dense<3.14> : tensor<1xf32>} : () -> tensor<1xf32>
  %0 = tosa.pad %arg0, %shape, %pad_const : (tensor<10xf32>, !tosa.shape<2>, tensor<1xf32>) -> tensor<?xf32>
  return %0 : tensor<?xf32>
}
