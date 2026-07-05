func.func @canonicalize_rank_size(%arg : tensor<1x2x?xf32>) -> !shape.size {
  %shape = shape.shape_of %arg : tensor<1x2x?xf32> -> !shape.shape
  %rank = shape.rank %shape : !shape.shape -> !shape.size
  return %rank : !shape.size
}
