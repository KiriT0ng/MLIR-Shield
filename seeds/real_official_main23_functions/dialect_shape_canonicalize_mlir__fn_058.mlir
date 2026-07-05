func.func @static_non_broadcastable() {
  %cs0 = shape.const_shape [1, 3] : !shape.shape
  %cs1 = shape.const_shape [1, 5] : !shape.shape
  %0 = shape.cstr_broadcastable %cs0, %cs1 : !shape.shape, !shape.shape
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
