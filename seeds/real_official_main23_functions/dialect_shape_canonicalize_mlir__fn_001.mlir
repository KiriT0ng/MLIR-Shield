func.func @f() -> (!shape.shape, !shape.shape) {
  %c2 = arith.constant 2 : index
  %0 = shape.const_shape [2, 3, 4, 5] : !shape.shape
  %head, %tail = "shape.split_at"(%0, %c2) : (!shape.shape, index) -> (!shape.shape, !shape.shape)
  return %head, %tail : !shape.shape, !shape.shape

}
