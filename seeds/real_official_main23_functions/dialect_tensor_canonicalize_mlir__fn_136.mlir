func.func @dim_of_collapse_shape(%t: tensor<?x?x?x7x?xf32>) -> index {
  %c1 = arith.constant 1 : index
  %0 = tensor.collapse_shape %t [[0], [1, 2, 3, 4]]
      : tensor<?x?x?x7x?xf32> into tensor<?x?xf32>
  %1 = tensor.dim %0, %c1 : tensor<?x?xf32>
  return %1 : index
}
