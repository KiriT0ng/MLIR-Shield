func.func @nonfoldable_num_elements(%shape : !shape.shape) -> !shape.size {
  %num_elements = shape.num_elements %shape : !shape.shape -> !shape.size
  return %num_elements : !shape.size
}
