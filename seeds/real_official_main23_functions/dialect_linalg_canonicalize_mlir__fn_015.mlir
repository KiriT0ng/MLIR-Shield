func.func @fold_fill_reshape_dynamic(%arg0 : tensor<?x?x?x?x?xf32>) -> tensor<?x?xf32> {
  %zero = arith.constant 0.0 : f32
  %0 = linalg.fill ins(%zero : f32) outs(%arg0 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2], [3, 4]]
      : tensor<?x?x?x?x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}
