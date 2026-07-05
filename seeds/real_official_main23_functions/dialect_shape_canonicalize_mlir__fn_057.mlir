func.func @f(%arg0 : tensor<?xindex>, %arg1 : tensor<?xindex>, %arg2 : tensor<0xindex>) {
  %0 = shape.const_shape [] : !shape.shape
  %1 = shape.cstr_broadcastable %arg0, %arg1, %0, %arg2
      : tensor<?xindex>, tensor<?xindex>, !shape.shape, tensor<0xindex>
  "consume.witness"(%1) : (!shape.witness) -> ()
  return
}
