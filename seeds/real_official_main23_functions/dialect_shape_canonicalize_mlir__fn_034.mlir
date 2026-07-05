func.func @out_of_bounds() -> !shape.size {
  %0 = shape.const_shape [0, 1, 2] : !shape.shape
  %c3 = shape.const_size 3
  %1 = shape.get_extent %0, %c3 : !shape.shape, !shape.size -> !shape.size
  return %1 : !shape.size
}
