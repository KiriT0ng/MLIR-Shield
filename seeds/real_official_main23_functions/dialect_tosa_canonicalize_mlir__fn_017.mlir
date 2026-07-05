func.func @clamp_f32_not_noop(%arg0: tensor<4xf32>) -> tensor<4xf32> {
  %0 = tosa.clamp %arg0 {min_val = -3.40282347E+38 : f32, max_val = 3.40282347E+38 : f32} : (tensor<4xf32>) -> tensor<4xf32>
  return %0 : tensor<4xf32>
}
