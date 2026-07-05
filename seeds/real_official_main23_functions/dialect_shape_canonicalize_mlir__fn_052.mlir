func.func @f(%arg0 : !shape.shape, %arg1 : !shape.shape) -> !shape.shape {
  %1 = shape.any %arg0, %arg1 : !shape.shape, !shape.shape -> !shape.shape
  return %1 : !shape.shape
}
