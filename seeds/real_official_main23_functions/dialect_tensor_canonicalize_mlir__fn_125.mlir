func.func @splat_dynamic_no_fold(%m: index) -> tensor<4x?xf32> {
  %f = arith.constant 1.0 : f32

  %t = tensor.splat %f[%m] : tensor<4x?xf32>
  return %t : tensor<4x?xf32>
}
