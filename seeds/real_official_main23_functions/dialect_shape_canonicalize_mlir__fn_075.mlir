func.func @index_to_size_to_index(%index : index) -> index {
  %size = shape.index_to_size %index
  %result = shape.size_to_index %size : !shape.size
  return %result : index
}
