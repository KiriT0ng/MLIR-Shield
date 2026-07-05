func.func @f(%arg0 : !shape.shape) -> !shape.shape {
  %0 = shape.const_shape [] : !shape.shape
  %1 = shape.broadcast %arg0, %0 : !shape.shape, !shape.shape -> !shape.shape
  return %1 : !shape.shape
}
