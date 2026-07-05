func.func @compose_collapse_of_expand(%arg : tensor<?x?x?xi64>, %arg1: index, %arg2: index, %arg3: index)
    -> tensor<?x?xi64> {
  %0 = tensor.expand_shape %arg [[0], [1], [2, 3]] output_shape [%arg1, %arg2, %arg3, 1]
    : tensor<?x?x?xi64> into tensor<?x?x?x1xi64>
  %1 = tensor.collapse_shape %0 [[0, 1], [2, 3]]
    : tensor<?x?x?x1xi64> into tensor<?x?xi64>
  return %1 : tensor<?x?xi64>
}
