func.func @reshape_splat_constant_float64() -> tensor<2x4x2xf64> {
  %c0 = arith.constant dense<42.0> : tensor<2x8xf64>
  %0 = tensor.expand_shape %c0 [[0], [1, 2]] output_shape [2, 4, 2]
      : tensor<2x8xf64> into tensor<2x4x2xf64>
  return %0 : tensor<2x4x2xf64>
}
