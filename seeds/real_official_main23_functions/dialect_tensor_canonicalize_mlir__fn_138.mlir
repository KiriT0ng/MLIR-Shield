func.func @collapse_expand_fold_to_cast(%t: tensor<?xf32>, %sz0: index) -> (tensor<?xf32>)
{
  %0 = tensor.expand_shape %t [[0, 1]] output_shape [1, %sz0] : tensor<?xf32> into tensor<1x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1]] : tensor<1x?xf32> into tensor<?xf32>
  return %1 : tensor<?xf32>
}
