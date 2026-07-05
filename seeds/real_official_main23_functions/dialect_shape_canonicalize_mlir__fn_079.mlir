func.func @cstr_broadcastable_scalar_unranked(%arg0 : tensor<*xf32>, %arg1 : tensor<index>) {
  %0 = shape.shape_of %arg1 : tensor<index> -> tensor<?xindex>
  %1 = shape.shape_of %arg0 : tensor<*xf32> -> tensor<?xindex>
  %2 = shape.cstr_broadcastable %0, %1 : tensor<?xindex>, tensor<?xindex>
  "consume.witness"(%2) : (!shape.witness) -> ()
  return
}
