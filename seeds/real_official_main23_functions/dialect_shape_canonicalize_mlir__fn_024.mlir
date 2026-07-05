func.func @const_index_to_size() -> !shape.size {
  %ci = arith.constant 123 : index
  %cs = shape.index_to_size %ci
  return %cs : !shape.size
}
