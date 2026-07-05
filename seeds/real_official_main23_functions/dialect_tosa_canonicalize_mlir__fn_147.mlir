func.func @canonicalize_max_pool2d_adaptive(%arg0: tensor<1x32x32x8xf32>) -> tensor<1x32x32x8xf32> {
  %kernel = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %stride = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %pad = tosa.const_shape {values = dense<[0, 0, 0, 0]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %0 = tosa.max_pool2d_adaptive %arg0, %kernel, %stride, %pad {nan_mode = IGNORE} :
         (tensor<1x32x32x8xf32>, !tosa.shape<2>, !tosa.shape<2>, !tosa.shape<4>) -> tensor<1x32x32x8xf32>
  return %0 : tensor<1x32x32x8xf32>
}
