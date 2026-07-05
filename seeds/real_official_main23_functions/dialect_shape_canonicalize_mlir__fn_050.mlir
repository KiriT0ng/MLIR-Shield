func.func @f(%arg : !shape.shape) -> !shape.shape {
  %0 = shape.const_shape [2, 3, 4] : !shape.shape
  %1 = shape.any %0, %arg : !shape.shape, !shape.shape -> !shape.shape
  return %1 : !shape.shape
}
