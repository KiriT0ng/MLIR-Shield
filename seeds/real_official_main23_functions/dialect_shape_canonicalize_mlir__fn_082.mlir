func.func @shape_eq_fold_0() -> i1 {
  %a = shape.const_shape [1, 2, 3, 4, 5, 6] : !shape.shape
  %b = shape.const_shape [1, 2, 3] : !shape.shape
  %result = shape.shape_eq %a, %b : !shape.shape, !shape.shape
  return %result : i1
}
