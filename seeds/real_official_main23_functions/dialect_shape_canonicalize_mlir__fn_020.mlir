func.func @fold_const_size() -> !shape.shape {
  %e0 = shape.const_size 3
  %e1 = shape.const_size 5
  %ret = shape.from_extents %e0, %e1 : !shape.size, !shape.size
  return %ret : !shape.shape
}
