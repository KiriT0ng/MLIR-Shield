func.func @pad_determine_val_f32(%arg0: tensor<?x?xf32>, %arg1 : tensor<2x2xi32>) -> tensor<?x?xf32> {
  %pad_const = "tosa.const"() {values = dense<3.14> : tensor<1xf32>} : () -> tensor<1xf32>
  %0 = tosa.const_shape { values = dense<[1, 0, 0, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %1 = tosa.pad %arg0, %0, %pad_const : (tensor<?x?xf32>, !tosa.shape<4>, tensor<1xf32>) -> tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}
