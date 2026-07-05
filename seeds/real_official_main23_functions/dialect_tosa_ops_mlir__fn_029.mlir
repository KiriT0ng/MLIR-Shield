func.func @test_max_pool2d_adaptive_bf16(%arg0: tensor<1x32x32x8xbf16>) -> tensor<1x32x32x8xbf16> {
  %kernel = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %stride = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %pad = tosa.const_shape {values = dense<[0, 0, 0, 0]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %0 = tosa.max_pool2d_adaptive %arg0, %kernel, %stride, %pad : (tensor<1x32x32x8xbf16>, !tosa.shape<2>, !tosa.shape<2>, !tosa.shape<4>) -> tensor<1x32x32x8xbf16>
  return %0 : tensor<1x32x32x8xbf16>
}
