func.func @pad_determine_val_quant(%arg0: tensor<?x?xi32>, %arg1 : tensor<2x2xi32>) -> tensor<?x?xi32> {
  %pad_const = "tosa.const"() {values =dense<3> : tensor<1xi32>} : () -> tensor<1xi32>
  %0 = tosa.const_shape { values = dense<[1, 0, 0, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %1 = tosa.pad %arg0, %0, %pad_const {input_zp = 42 : i32} : (tensor<?x?xi32>, !tosa.shape<4>, tensor<1xi32>) -> tensor<?x?xi32>
  return %1 : tensor<?x?xi32>
}
