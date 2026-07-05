func.func @cast_extent_tensor(%arg : tensor<?x?x?xf32>) -> tensor<?xindex> {
  %0 = shape.shape_of %arg : tensor<?x?x?xf32> -> tensor<3xindex>
  %1 = tensor.cast %0 : tensor<3xindex> to tensor<?xindex>
  return %1 : tensor<?xindex>
}
