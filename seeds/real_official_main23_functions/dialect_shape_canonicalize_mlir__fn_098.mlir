func.func @is_broadcastable_on_same_shape(%shape : !shape.shape) -> i1 {
  %0 = shape.is_broadcastable %shape, %shape, %shape
      : !shape.shape, !shape.shape, !shape.shape
  return %0 : i1
}
