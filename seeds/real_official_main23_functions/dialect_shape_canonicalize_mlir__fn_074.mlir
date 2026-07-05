func.func @dont_canonicalize_rank(%arg : tensor<*xf32>) -> index {
  %shape = shape.shape_of %arg : tensor<*xf32> -> tensor<?xindex>
  %rank = shape.rank %shape : tensor<?xindex> -> index
  return %rank : index
}
