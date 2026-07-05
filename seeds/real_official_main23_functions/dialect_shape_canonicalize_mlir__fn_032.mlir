func.func @not_const(%arg0: tensor<?xindex>) -> index {
  %c3 = arith.constant 3 : index
  %0 = shape.get_extent %arg0, %c3 : tensor<?xindex>, index -> index
  return %0 : index
}
