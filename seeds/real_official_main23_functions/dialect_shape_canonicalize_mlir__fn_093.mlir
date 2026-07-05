func.func @fold_index_cast_on_index(%arg: index) -> index {
  %0 = shape.size_to_index %arg : index
  return %0 : index
}
