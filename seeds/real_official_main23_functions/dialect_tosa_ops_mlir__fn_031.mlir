func.func @test_dynamic_max_pool2d_adaptive_f16(%arg0: tensor<1x?x?x8xf16>) -> tensor<1x?x?x8xf16> {
  %kernel = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %stride = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %pad = tosa.const_shape {values = dense<[0, 0, 0, 0]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %0 = tosa.max_pool2d_adaptive %arg0, %kernel, %stride, %pad : (tensor<1x?x?x8xf16>, !tosa.shape<2>, !tosa.shape<2>, !tosa.shape<4>) -> tensor<1x?x?x8xf16>
  return %0 : tensor<1x?x?x8xf16>
}
