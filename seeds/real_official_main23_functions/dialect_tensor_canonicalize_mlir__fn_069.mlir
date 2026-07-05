func.func @no_fold_expand_of_collapse_fully_dynamic(%arg0 : tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index)
    -> tensor<?x?x?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1], [2]]
      : tensor<?x?x?xf32> into tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%arg1, %arg2, %arg3]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}
