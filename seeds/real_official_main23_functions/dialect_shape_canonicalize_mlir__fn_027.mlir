func.func @nonfoldable_index_to_size(%ci : index) -> !shape.size {
  %cs = shape.index_to_size %ci
  return %cs : !shape.size
}
