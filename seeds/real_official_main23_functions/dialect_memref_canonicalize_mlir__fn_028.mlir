func.func @compose_expand_of_expand_of_zero_dim(%arg0 : memref<f32>)
    -> memref<1x1x1xf32> {
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  %1 = memref.expand_shape %0 [[0, 1, 2]] output_shape [1, 1, 1]
      : memref<1xf32> into memref<1x1x1xf32>
  return %1 : memref<1x1x1xf32>
}
