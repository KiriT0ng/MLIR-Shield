func.func @f(%arg0 : !shape.shape) {
  %cs0 = shape.const_shape [] : !shape.shape
  %0 = shape.cstr_broadcastable %cs0, %cs0, %arg0 : !shape.shape, !shape.shape, !shape.shape
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
