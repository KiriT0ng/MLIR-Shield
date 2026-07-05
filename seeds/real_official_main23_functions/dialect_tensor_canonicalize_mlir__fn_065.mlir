func.func @no_fold_parallel_collapse_of_expand_dynamic(%arg0 : tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index)
    -> tensor<?x?x?xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2], [3]] output_shape [%arg1, %arg2, %arg3, %arg4]
      : tensor<?x?x?xf32> into tensor<?x?x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0], [1], [2, 3]]
      : tensor<?x?x?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}
