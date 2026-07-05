func.func @dim_of_expand_shape(%t: tensor<?x?xf32>, %sz0: index, %sz1: index) -> index {
  %c2 = arith.constant 2 : index
  %0 = tensor.expand_shape %t [[0], [1, 2, 3, 4, 5]] output_shape [%sz0, 1, %sz1, 5, 1, 8]
      : tensor<?x?xf32> into tensor<?x1x?x5x1x8xf32>
  %1 = tensor.dim %0, %c2 : tensor<?x1x?x5x1x8xf32>
  return %1 : index
}
