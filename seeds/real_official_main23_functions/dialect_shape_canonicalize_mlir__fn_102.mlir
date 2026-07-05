func.func @broadcast_on_duplicate_shapes(%a : !shape.shape, %b : !shape.shape)
    -> !shape.shape {
  %0 = shape.broadcast %a, %b, %a, %a, %a, %b : !shape.shape, !shape.shape,
      !shape.shape, !shape.shape, !shape.shape, !shape.shape -> !shape.shape
  return %0 : !shape.shape
}
