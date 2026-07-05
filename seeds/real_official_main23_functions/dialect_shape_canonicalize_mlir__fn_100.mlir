func.func @cstr_broadcastable_on_duplicate_shapes(%a : !shape.shape,
    %b : !shape.shape) -> !shape.witness {
  %0 = shape.cstr_broadcastable %a, %b, %a, %a, %a, %b : !shape.shape,
      !shape.shape, !shape.shape, !shape.shape, !shape.shape, !shape.shape
  return %0 : !shape.witness
}
