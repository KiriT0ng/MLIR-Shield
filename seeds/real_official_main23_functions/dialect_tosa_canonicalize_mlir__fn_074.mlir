func.func @tile_fold(%arg0: tensor<3x4xf32>) -> tensor<3x4xf32> {
  %cst = tosa.const_shape { values = dense<1> : tensor<2xindex> } : () -> !tosa.shape<2>
  %0 = tosa.tile %arg0, %cst: (tensor<3x4xf32>, !tosa.shape<2>) -> tensor<3x4xf32>
  return %0 : tensor<3x4xf32>
}
