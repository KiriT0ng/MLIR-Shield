func.func @f(%arg0 : !shape.shape) {
  %0 = shape.cstr_broadcastable %arg0, %arg0 : !shape.shape, !shape.shape
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
