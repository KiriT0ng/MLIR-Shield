func.func @f(%arg0 : !shape.shape) {
  %cs0 = shape.const_shape [1, 3] : !shape.shape
  %0 = shape.cstr_broadcastable %arg0, %cs0 : !shape.shape, !shape.shape
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
