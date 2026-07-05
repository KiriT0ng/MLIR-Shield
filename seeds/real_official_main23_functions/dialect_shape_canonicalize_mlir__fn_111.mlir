func.func @shape_of_from_reshape_nofold(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> !shape.shape {
  %0 = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  %1 = shape.shape_of %0 : tensor<*xf32> -> !shape.shape
  return %1 : !shape.shape
}
