func.func @dont_canonicalize_unranked_slice_dynamic_size(%arg0: tensor<1x4xf32>) -> tensor<*xf32> {
  %start = tosa.const_shape {values = dense<[0, 0]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %size = tosa.const_shape {values = dense<[1, -1]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %0 = tosa.slice %arg0, %start, %size : (tensor<1x4xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<*xf32>
  return %0 : tensor<*xf32>
}
