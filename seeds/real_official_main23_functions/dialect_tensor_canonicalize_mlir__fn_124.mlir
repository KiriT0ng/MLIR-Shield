func.func @splat_fold() -> tensor<4xf32> {
  %c = arith.constant 1.0 : f32
  %t = tensor.splat %c : tensor<4xf32>
  return %t : tensor<4xf32>

}
