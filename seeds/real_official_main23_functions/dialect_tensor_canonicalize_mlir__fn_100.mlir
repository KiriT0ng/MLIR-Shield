func.func @collapse_shape_splat_dynamic_no_fold(%f: f32, %m: index) -> tensor<2x?xf32> {
  %c0 = tensor.splat %f[%m] : tensor<2x2x?xf32>
  %0 = tensor.collapse_shape %c0 [[0], [1, 2]] : tensor<2x2x?xf32> into tensor<2x?xf32>
  return %0 : tensor<2x?xf32>
}
