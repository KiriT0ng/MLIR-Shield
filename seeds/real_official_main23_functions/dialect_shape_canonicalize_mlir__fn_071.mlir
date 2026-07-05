func.func @dont_fold_rank(%shape : tensor<?xindex>) -> index {
  %rank = shape.rank %shape : tensor<?xindex> -> index
  return %rank : index
}
