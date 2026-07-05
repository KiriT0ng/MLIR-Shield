func.func @f(%arg0 : !shape.shape, %arg1 : !shape.shape, %arg2 : !shape.shape) {
  %0 = shape.cstr_broadcastable %arg0, %arg1 : !shape.shape, !shape.shape
  %1 = shape.cstr_broadcastable %arg1, %arg2 : !shape.shape, !shape.shape
  %2 = shape.assuming_all %0, %1
  "consume.witness"(%2) : (!shape.witness) -> ()
  return
}
