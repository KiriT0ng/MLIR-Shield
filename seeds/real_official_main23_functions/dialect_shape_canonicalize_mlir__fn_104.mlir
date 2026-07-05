func.func @broadcast_as_tensor_cast(%a : tensor<3xindex>) -> tensor<?xindex> {
  %0 = shape.broadcast %a : tensor<3xindex> -> tensor<?xindex>
  return %0 : tensor<?xindex>
}
