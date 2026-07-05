func.func @clamp_i32_not_noop(%arg0: tensor<4xi32>) -> tensor<4xi32> {
  %0 = tosa.clamp %arg0 {min_val = 1 : i32, max_val = 4 : i32} : (tensor<4xi32>) -> tensor<4xi32>
  return %0 : tensor<4xi32>
}
