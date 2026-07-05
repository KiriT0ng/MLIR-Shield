func.func @slice_nofold_static(%arg0: tensor<3x4xf32>) -> tensor<3x2xf32> {
  %0 = tosa.const_shape {values = dense<[0, 0]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.const_shape {values = dense<[3, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %3 = tosa.slice %arg0, %0, %1 : (tensor<3x4xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<3x2xf32>
  return %3 : tensor<3x2xf32>
}
