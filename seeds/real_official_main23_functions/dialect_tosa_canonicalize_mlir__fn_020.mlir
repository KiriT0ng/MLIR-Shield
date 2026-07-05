func.func @clamp_boolean_is_noop(%arg0: tensor<4xi1>) -> tensor<4xi1> {
  %0 = tosa.clamp %arg0 {min_val = false, max_val = true} : (tensor<4xi1>) -> tensor<4xi1>
  return %0 : tensor<4xi1>
}
