func.func @const_index_to_size_to_index() -> index {
  %ci0 = arith.constant 123 : index
  %cs0 = shape.index_to_size %ci0
  %ci1 = shape.size_to_index %cs0 : !shape.size
  return %ci1 : index
}
