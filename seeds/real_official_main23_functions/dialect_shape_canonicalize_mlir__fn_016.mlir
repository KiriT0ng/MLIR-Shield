func.func @f() -> !shape.shape {
  %lhs = shape.const_shape [0, 1] : !shape.shape
  %rhs = shape.const_shape [2, 3] : !shape.shape
  %0 = shape.concat %lhs, %rhs : !shape.shape , !shape.shape -> !shape.shape
  return %0 : !shape.shape
}
