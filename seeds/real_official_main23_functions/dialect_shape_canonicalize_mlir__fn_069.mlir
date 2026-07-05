func.func @dont_fold_rank(%shape : !shape.shape) -> !shape.size {
  %rank = shape.rank %shape : !shape.shape -> !shape.size
  return %rank : !shape.size
}
