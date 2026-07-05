func.func @test_avg_pool2d_adaptive_f16(%arg0: tensor<1x7x7x9xf16>) -> tensor<1x7x7x9xf16> {
  %input_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf16>}> : () -> tensor<1xf16>
  %output_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf16>}> : () -> tensor<1xf16>
  %kernel = tosa.const_shape {values = dense<[2, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %stride = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %pad = tosa.const_shape {values = dense<[0, 1, 0, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %0 = tosa.avg_pool2d_adaptive %arg0, %input_zp, %output_zp, %kernel, %stride, %pad {acc_type = f16} : (tensor<1x7x7x9xf16>, tensor<1xf16>, tensor<1xf16>, !tosa.shape<2>, !tosa.shape<2>, !tosa.shape<4>) -> tensor<1x7x7x9xf16>
  return %0 : tensor<1x7x7x9xf16>
}
