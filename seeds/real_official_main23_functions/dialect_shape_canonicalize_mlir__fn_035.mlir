func.func @not_const(%arg0 : !shape.shape) -> !shape.size {
  %c3 = shape.const_size 3
  %0 = shape.get_extent %arg0, %c3 : !shape.shape, !shape.size -> !shape.size
  return %0 : !shape.size
}
