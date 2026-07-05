func.func @fold_collapse_of_collapse_trailing_unit_dims_dynamic(
    %arg0: tensor<1x1x?x1x1x1xf32>) -> tensor<?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1, 2], [3], [4], [5]]
      : tensor<1x1x?x1x1x1xf32> into tensor<?x1x1x1xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2, 3]]
      : tensor<?x1x1x1xf32> into tensor<?xf32>
  return %1 : tensor<?xf32>
}
