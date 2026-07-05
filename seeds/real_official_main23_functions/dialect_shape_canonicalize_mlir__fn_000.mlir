func.func @f(%arg0: tensor<2x3x4xf32>) -> tensor<3xindex> {
  %0 = shape.shape_of %arg0 : tensor<2x3x4xf32> -> tensor<3xindex>
  return %0 : tensor<3xindex>
}
