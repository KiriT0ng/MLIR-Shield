func.func @basic() -> index {
  %0 = shape.const_shape [0, 1, 2] : tensor<3xindex>
  %c2 = arith.constant 2 : index
  %1 = shape.get_extent %0, %c2 : tensor<3xindex>, index -> index
  return %1 : index
}
