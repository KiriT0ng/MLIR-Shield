func.func @f() -> tensor<4xindex> {
  %lhs = shape.const_shape [0, 1] : tensor<2xindex>
  %rhs = shape.const_shape [2, 3] : tensor<2xindex>
  %0 = shape.concat %lhs, %rhs : tensor<2xindex>, tensor<2xindex> -> tensor<4xindex>
  return %0 : tensor<4xindex>
}
