func.func @shape_of_static_with_shape_result(%arg0: tensor<3xf32>) -> !shape.shape {
  %0 = shape.shape_of %arg0 : tensor<3xf32> -> !shape.shape
  return %0 : !shape.shape
}
