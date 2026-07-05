func.func @shape_of_from_reshape(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> tensor<?xindex> {
  %0 = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  %1 = shape.shape_of %0 : tensor<*xf32> -> tensor<?xindex>
  return %1 : tensor<?xindex>
}
