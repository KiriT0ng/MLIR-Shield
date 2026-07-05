func.func @fold_rank() -> !shape.size {
  %shape = shape.const_shape [3, 4, 5, 6, 7] : !shape.shape
  %rank = shape.rank %shape : !shape.shape -> !shape.size
  return %rank : !shape.size
}
