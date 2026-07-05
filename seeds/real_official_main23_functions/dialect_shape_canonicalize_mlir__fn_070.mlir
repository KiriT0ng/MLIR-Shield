func.func @fold_rank() -> index {
  %shape = shape.const_shape [3, 4, 5, 6, 7] : tensor<5xindex>
  %rank = shape.rank %shape : tensor<5xindex> -> index
  return %rank : index
}
