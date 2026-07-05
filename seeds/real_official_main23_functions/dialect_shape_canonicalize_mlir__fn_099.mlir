func.func @is_broadcastable_on_duplicate_shapes(%a : !shape.shape, %b : !shape.shape)
    -> i1 {
  %0 = shape.is_broadcastable %a, %b, %a, %a, %a, %b : !shape.shape,
      !shape.shape, !shape.shape, !shape.shape, !shape.shape, !shape.shape
  return %0 : i1
}
