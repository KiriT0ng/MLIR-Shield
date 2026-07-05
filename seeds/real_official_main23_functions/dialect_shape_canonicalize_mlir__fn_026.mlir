func.func @nonfoldable_size_to_index(%cs : !shape.size) -> index {
  %ci = shape.size_to_index %cs : !shape.size
  return %ci : index
}
