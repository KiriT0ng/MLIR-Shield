func.func @broadcast() -> tensor<2xindex> {
  %0 = shape.const_shape [1, 2] : tensor<2xindex>
  %1 = shape.const_shape [7, 1] : tensor<2xindex>
  %2 = shape.broadcast %0, %1
      : tensor<2xindex>, tensor<2xindex> -> tensor<2xindex>
  return %2 : tensor<2xindex>
}
