func.func @f() {
  %cs0 = shape.const_shape [0, 1] : !shape.shape
  %cs1 = shape.const_shape [0, 1] : !shape.shape
  %cs2 = shape.const_shape [0, 1] : !shape.shape
  %0 = shape.cstr_eq %cs0, %cs1, %cs2 : !shape.shape, !shape.shape, !shape.shape
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
