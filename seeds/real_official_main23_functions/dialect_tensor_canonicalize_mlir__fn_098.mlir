func.func @expand_shape_splat_dynamic_no_fold(%arg: f32, %m: index, %sz0: index) -> tensor<2x2x?xf32> {
  %c0 = tensor.splat %arg[%m] : tensor<2x?xf32>
  %0 = tensor.expand_shape %c0 [[0], [1, 2]] output_shape [2, 2, %sz0] : tensor<2x?xf32> into tensor<2x2x?xf32>
  return %0 : tensor<2x2x?xf32>
}
