func.func @canonicalize_avg_pool2d_adaptive(%arg0: tensor<1x7x7x9xf32>, %input_zp: tensor<1xf32>, %output_zp: tensor<1xf32>) -> tensor<1x7x7x9xf32> {
  %kernel = tosa.const_shape {values = dense<[3, 3]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %stride = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %pad = tosa.const_shape {values = dense<[1, 1, 1, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %0 = tosa.avg_pool2d_adaptive %arg0, %input_zp, %output_zp, %kernel, %stride, %pad {acc_type = f32} :
         (tensor<1x7x7x9xf32>, tensor<1xf32>, tensor<1xf32>, !tosa.shape<2>, !tosa.shape<2>, !tosa.shape<4>) -> tensor<1x7x7x9xf32>
  return %0 : tensor<1x7x7x9xf32>
}
