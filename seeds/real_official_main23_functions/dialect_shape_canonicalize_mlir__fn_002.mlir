func.func @f() -> (!shape.shape, !shape.shape) {
  %c-1 = arith.constant -1 : index
  %0 = shape.const_shape [2, 3, 4, 5] : !shape.shape
  %head, %tail = "shape.split_at"(%0, %c-1) : (!shape.shape, index) -> (!shape.shape, !shape.shape)
  return %head, %tail : !shape.shape, !shape.shape
}
