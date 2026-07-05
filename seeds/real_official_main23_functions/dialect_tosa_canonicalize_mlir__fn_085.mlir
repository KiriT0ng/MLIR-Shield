func.func @dont_canonicalize_unranked_clamp(%arg0 : tensor<*xf32>) -> tensor<*xf32> {
  %0 = tosa.clamp %arg0 {min_val = 0.0 : f32, max_val = 1.0 : f32} : (tensor<*xf32>) -> tensor<*xf32>
  return %0 : tensor<*xf32>
}
