func.func @dont_canonicalize_non_const_max_pool2d_adaptive(%arg0: tensor<1x?x?x8xf32>) -> tensor<1x?x?x8xf32> {
  %dim1 = tosa.dim %arg0 {axis = 1 : i32} : (tensor<1x?x?x8xf32>) -> !tosa.shape<1>
  %dim2 = tosa.dim %arg0 {axis = 2 : i32} : (tensor<1x?x?x8xf32>) -> !tosa.shape<1>
  %kernel = tosa.concat_shape %dim1, %dim2 : (!tosa.shape<1>, !tosa.shape<1>) -> !tosa.shape<2>
  %stride = tosa.const_shape {values = dense<[1, 1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %pad = tosa.const_shape {values = dense<[0, 0, 0, 0]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %0 = tosa.max_pool2d_adaptive %arg0, %kernel, %stride, %pad {nan_mode = IGNORE} :
          (tensor<1x?x?x8xf32>, !tosa.shape<2>, !tosa.shape<2>, !tosa.shape<4>) -> tensor<1x?x?x8xf32>
  return %0 : tensor<1x?x?x8xf32>
}
