func.func @slice_fold_static_dynamic(%arg0: tensor<?x4xf32>) -> tensor<?x4xf32> {
  %0 = tosa.const_shape {values = dense<[0, 0]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.const_shape {values = dense<[-1, -1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %3 = tosa.slice %arg0, %0, %1 : (tensor<?x4xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<?x4xf32>
  return %3 : tensor<?x4xf32>
}
