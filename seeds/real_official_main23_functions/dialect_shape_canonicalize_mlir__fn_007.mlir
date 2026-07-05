func.func @broadcast_variadic() -> !shape.shape {
  %0 = shape.const_shape [2, 1] : tensor<2xindex>
  %1 = shape.const_shape [7, 2, 1] : tensor<3xindex>
  %2 = shape.const_shape [1, 10] : tensor<2xindex>
  %3 = shape.broadcast %0, %1, %2 : tensor<2xindex>, tensor<3xindex>, tensor<2xindex> -> !shape.shape
  return %3 : !shape.shape
}
