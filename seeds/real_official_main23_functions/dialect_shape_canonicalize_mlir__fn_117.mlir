func.func @min_same_arg(%a: !shape.shape) -> !shape.shape {
  %1 = shape.min %a, %a : !shape.shape, !shape.shape -> !shape.shape
  return %1 : !shape.shape
}
