func.func @reshape_canonicalize_double(%arg0: tensor<?x10xf32>) -> tensor<?x5xf32> {
  %cst0 = "tosa.const_shape"() <{values = dense<[5, -1]> : tensor<2xindex>}> : () -> !tosa.shape<2>
  %0 = tosa.reshape %arg0, %cst0 : (tensor<?x10xf32>, !tosa.shape<2>) -> tensor<5x?xf32>
  %cst1 = "tosa.const_shape"() <{values = dense<[-1, 5]> : tensor<2xindex>}> : () -> !tosa.shape<2>
  %1 = tosa.reshape %0, %cst1 : (tensor<5x?xf32>, !tosa.shape<2>) -> tensor<?x5xf32>
  return %1 : tensor<?x5xf32>
}
