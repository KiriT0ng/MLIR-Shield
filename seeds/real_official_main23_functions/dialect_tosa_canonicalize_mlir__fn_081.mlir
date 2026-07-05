func.func @fold_resize_bilinear(%arg0 : tensor<1x15x13x1xi8>) -> tensor<1x15x13x1xi8> {
  %scale = tosa.const_shape { values = dense<[2, 2, 1, 1]> : tensor<4xindex> } : () -> !tosa.shape<4>
  %offset = tosa.const_shape { values = dense<0> : tensor<2xindex> } : () -> !tosa.shape<2>
  %border = tosa.const_shape { values = dense<0> : tensor<2xindex> } : () -> !tosa.shape<2>
  %resize = tosa.resize %arg0, %scale, %offset, %border {mode = BILINEAR} : (tensor<1x15x13x1xi8>, !tosa.shape<4>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x15x13x1xi8>
  return %resize : tensor<1x15x13x1xi8>
}
