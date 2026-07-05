func.func @clamp_boolean_dynamic_is_noop(%arg0: tensor<?xi1>) -> tensor<?xi1> {
  %0 = tosa.clamp %arg0 {min_val = false, max_val = true} : (tensor<?xi1>) -> tensor<?xi1>
  return %0 : tensor<?xi1>
}
