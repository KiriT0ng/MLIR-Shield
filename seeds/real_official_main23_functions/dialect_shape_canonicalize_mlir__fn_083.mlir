func.func @shape_eq_do_not_fold(%a : !shape.shape) -> i1 {
  %b = shape.const_shape [4, 5, 6] : !shape.shape
  %result = shape.shape_eq %a, %b : !shape.shape, !shape.shape
  return %result : i1
}
