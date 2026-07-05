func.func @canonicalize_rank(%arg : tensor<1x2x?xf32>) -> index {
  %shape = shape.shape_of %arg : tensor<1x2x?xf32> -> tensor<?xindex>
  %rank = shape.rank %shape : tensor<?xindex> -> index
  return %rank : index
}
