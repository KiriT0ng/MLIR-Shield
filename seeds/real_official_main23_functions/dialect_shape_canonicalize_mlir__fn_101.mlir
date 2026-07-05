func.func @broadcast_on_same_shape(%shape : !shape.shape) -> !shape.shape {
  %0 = shape.broadcast %shape, %shape, %shape : !shape.shape, !shape.shape,
      !shape.shape -> !shape.shape
  return %0 : !shape.shape
}
