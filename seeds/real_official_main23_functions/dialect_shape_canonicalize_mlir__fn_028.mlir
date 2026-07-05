func.func @num_elements() -> !shape.size {
  %shape = shape.const_shape [4, 5, 6] : !shape.shape
  %num_elements = shape.num_elements %shape : !shape.shape -> !shape.size
  return %num_elements : !shape.size
}
