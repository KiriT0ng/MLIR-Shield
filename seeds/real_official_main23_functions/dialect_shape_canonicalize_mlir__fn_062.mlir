func.func @f() {
  %cs0 = shape.const_shape [8, 1] : !shape.shape
  %cs1 = shape.const_shape [1, 8] : !shape.shape
  %cs2 = shape.const_shape [1, 1] : !shape.shape
  %0 = shape.cstr_broadcastable %cs0, %cs1, %cs2 : !shape.shape, !shape.shape, !shape.shape
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
