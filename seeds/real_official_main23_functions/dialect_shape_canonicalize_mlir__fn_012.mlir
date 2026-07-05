func.func @all_empty(%arg0: tensor<f32>, %arg1: tensor<i1>) -> tensor<0xindex> {
  %1 = shape.shape_of %arg0 : tensor<f32> -> tensor<0xindex>
  %2 = shape.shape_of %arg1 : tensor<i1> -> tensor<0xindex>
  %3 = shape.const_shape [] : tensor<0xindex>
  %4 = shape.broadcast %1, %2, %3 : tensor<0xindex>, tensor<0xindex>, tensor<0xindex> -> tensor<0xindex>
  return %4 : tensor<0xindex>
}
