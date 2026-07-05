func.func @broadcast_as_from_extent_tensor(%a : tensor<?xindex>) -> !shape.shape {
  %0 = shape.broadcast %a : tensor<?xindex> -> !shape.shape
  return %0 : !shape.shape
}
