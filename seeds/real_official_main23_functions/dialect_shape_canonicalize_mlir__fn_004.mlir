func.func @f() -> !shape.shape {
  %0 = shape.const_shape [1, 2] : !shape.shape
  %1 = shape.const_shape [7, 1] : !shape.shape
  %2 = shape.broadcast %0, %1 : !shape.shape, !shape.shape -> !shape.shape
  return %2 : !shape.shape
}
