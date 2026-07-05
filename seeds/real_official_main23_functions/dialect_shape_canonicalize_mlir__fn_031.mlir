func.func @out_of_bounds() -> index {
  %0 = shape.const_shape [0, 1, 2] : tensor<3xindex>
  %c3 = arith.constant 3 : index
  %1 = shape.get_extent %0, %c3 : tensor<3xindex>, index -> index
  return %1 : index
}
