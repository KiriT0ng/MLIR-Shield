func.func @pad_noop_padding_mismatch_nofold(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
  %shape = tosa.const_shape { values = dense<[1, 0, 0, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %pad_const = "tosa.const"() {values = dense<3.14> : tensor<1xf32>} : () -> tensor<1xf32>
  %1 = tosa.pad %arg0, %shape, %pad_const : (tensor<?x?xf32>, !tosa.shape<4>, tensor<1xf32>) -> tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}
