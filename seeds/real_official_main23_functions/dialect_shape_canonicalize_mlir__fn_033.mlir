func.func @basic() -> !shape.size {
  %0 = shape.const_shape [0, 1, 2] : !shape.shape
  %c2 = shape.const_size 2
  %1 = shape.get_extent %0, %c2 : !shape.shape, !shape.size -> !shape.size
  return %1 : !shape.size
}
