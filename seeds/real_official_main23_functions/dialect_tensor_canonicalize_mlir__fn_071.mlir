func.func @compose_expand_of_collapse_last_two_dims(%arg0: tensor<?x64x1xf32>) -> tensor<?x384xf32> {
  %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<?x64x1xf32> into tensor<?xf32>
  %c0 = arith.constant 0 : index
  %dim = tensor.dim %collapsed, %c0 : tensor<?xf32>
  %c384= arith.constant 384 : index
  %div = arith.divui %dim, %c384 : index
  %expanded = tensor.expand_shape %collapsed [[0, 1]] output_shape [%div, 384] : tensor<?xf32> into tensor<?x384xf32>
  return %expanded : tensor<?x384xf32>
}
