func.func @size_to_index_to_size(%size : !shape.size) -> !shape.size {
  %idx = shape.size_to_index %size : !shape.size
  %result = shape.index_to_size %idx
  return %result : !shape.size
}
