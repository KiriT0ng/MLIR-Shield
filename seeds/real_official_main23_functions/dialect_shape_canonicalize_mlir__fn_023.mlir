func.func @const_size_to_index() -> index {
  %cs = shape.const_size 123
  %ci = shape.size_to_index %cs : !shape.size
  return %ci : index
}
