func.func @fold_collapse_of_expand_dynamic(%arg0 : tensor<?x?xf32>, %arg1: index, %arg2: index)
    -> tensor<?x?xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg1, 4, %arg2]
      : tensor<?x?xf32> into tensor<?x4x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1], [2]]
      : tensor<?x4x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}
