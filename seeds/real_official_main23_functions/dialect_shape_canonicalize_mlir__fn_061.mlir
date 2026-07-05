func.func @broadcastable_on_extent_tensors(%arg : tensor<?xindex>) {
  %0 = shape.cstr_broadcastable %arg, %arg : tensor<?xindex>, tensor<?xindex>
  "consume.witness"(%0) : (!shape.witness) -> ()
  return
}
