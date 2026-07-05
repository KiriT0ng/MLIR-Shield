func.func @cstr_broadcastable_scalar(%arg0 : tensor<?xf32>) {
  %0 = shape.const_shape [] : !shape.shape
  %1 = shape.shape_of %arg0 : tensor<?xf32> -> tensor<?xindex>
  %2 = shape.cstr_broadcastable %0, %1 : !shape.shape, tensor<?xindex>
  "consume.witness"(%2) : (!shape.witness) -> ()
  return
}
