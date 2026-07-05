func.func @fold_collapse_of_expand_unit_dims_in_middle(%arg0 : tensor<?x?x?xf32>, %sz0: index, %sz1: index, %sz2: index)
    -> tensor<?x?xf32> {
  %0 = tensor.expand_shape %arg0 [[0], [1], [2, 3]] output_shape [%sz0, %sz1, 1, %sz2]
      : tensor<?x?x?xf32> into tensor<?x?x1x?xf32>
  %1 = tensor.collapse_shape %0 [[0], [1, 2, 3]]
      : tensor<?x?x1x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}
