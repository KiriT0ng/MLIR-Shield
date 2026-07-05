func.func @fold_to_extent_tensor_on_tensor(%arg: tensor<?xindex>) -> tensor<?xindex> {
  %0 = shape.to_extent_tensor %arg : tensor<?xindex> -> tensor<?xindex>
  return %0 : tensor<?xindex>
}
