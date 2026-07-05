func.func @fold_resize_identity_scale_to_unranked(%arg0 : tensor<1x15x13x1xf32>) -> tensor<*xf32> {
  %scale = tosa.const_shape { values = dense<[1, 1, 1, 1]> : tensor<4xindex> } : () -> !tosa.shape<4>
  %offset = tosa.const_shape { values = dense<0> : tensor<2xindex> } : () -> !tosa.shape<2>
  %border = tosa.const_shape { values = dense<0> : tensor<2xindex> } : () -> !tosa.shape<2>
  %resize = tosa.resize %arg0, %scale, %offset, %border {mode = NEAREST_NEIGHBOR} : (tensor<1x15x13x1xf32>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<*xf32>
  return %resize : tensor<*xf32>
}
