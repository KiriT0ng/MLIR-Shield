func.func @shape_of_0d(%arg0: tensor<f32>) -> tensor<?xindex> {
  %0 = shape.shape_of %arg0 : tensor<f32> -> tensor<?xindex>
  return %0 : tensor<?xindex>
}
