func.func @compose_collapse_of_collapse_zero_dim(%arg0 : memref<1x1x1xf32>)
    -> memref<f32> {
  %0 = memref.collapse_shape %arg0 [[0, 1, 2]]
      : memref<1x1x1xf32> into memref<1xf32>
  %1 = memref.collapse_shape %0 [] : memref<1xf32> into memref<f32>
  return %1 : memref<f32>
}
