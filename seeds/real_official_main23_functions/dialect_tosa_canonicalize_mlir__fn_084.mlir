func.func @resize_nofold_asymmetric_y_scale(%arg0 : tensor<1x15x13x1xf32>) -> tensor<1x29x13x1xf32> {
  %scale = tosa.const_shape { values = dense<[4, 2, 1, 1]> : tensor<4xindex> } : () -> !tosa.shape<4>
  %offset = tosa.const_shape { values = dense<0> : tensor<2xindex> } : () -> !tosa.shape<2>
  %border = tosa.const_shape { values = dense<0> : tensor<2xindex> } : () -> !tosa.shape<2>
  %resize = tosa.resize %arg0, %scale, %offset, %border {mode = NEAREST_NEIGHBOR} : (tensor<1x15x13x1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x29x13x1xf32>
  return %resize : tensor<1x29x13x1xf32>
}
