func.func @max_same_arg(%a: !shape.shape) -> !shape.shape {
  %1 = shape.max %a, %a : !shape.shape, !shape.shape -> !shape.shape
  return %1 : !shape.shape
}
