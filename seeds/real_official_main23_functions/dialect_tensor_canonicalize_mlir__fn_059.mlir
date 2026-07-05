func.func @compose_expand_of_expand(%arg0 : tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index)
    -> tensor<?x6x4x?x5xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg1, 4, %arg2]
      : tensor<?x?xf32> into tensor<?x4x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2], [3, 4]] output_shape [%arg3, 6, 4, %arg4, 5] : tensor<?x4x?xf32> into tensor<?x6x4x?x5xf32>
  return %1 : tensor<?x6x4x?x5xf32>
}
