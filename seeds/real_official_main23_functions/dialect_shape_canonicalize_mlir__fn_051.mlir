func.func @f(%arg : tensor<?xindex>) -> tensor<3xindex> {
  %0 = shape.const_shape [2, 3, 4] : tensor<3xindex>
  %1 = shape.any %0, %arg : tensor<3xindex>, tensor<?xindex> -> tensor<3xindex>
  return %1 : tensor<3xindex>
}
