func.func @cast_extent_tensor(%arg : tensor<?x?x?x?xf32>) -> tensor<3xindex> {
  %0 = shape.shape_of %arg : tensor<?x?x?x?xf32> -> tensor<?xindex>
  %1 = tensor.cast %0 : tensor<?xindex> to tensor<3xindex>
  return %1 : tensor<3xindex>
}
