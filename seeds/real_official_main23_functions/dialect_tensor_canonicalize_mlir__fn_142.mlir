func.func @dim_of_reshape(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>)
    -> index {
  %c3 = arith.constant 3 : index
  %0 = tensor.reshape %arg0(%arg1)
      : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  // Update the shape to test that the load ends up in the right place.
  tensor.insert %c3 into %arg1[%c3] : tensor<?xindex>
  %1 = tensor.dim %0, %c3 : tensor<*xf32>
  return %1 : index
}
