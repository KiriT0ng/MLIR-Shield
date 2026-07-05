func.func @clamp_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %14 = tosa.clamp %arg0 {min_val = 1.0 : f32, max_val = 5.0 : f32, nan_mode = IGNORE} : (tensor<5x4xf32>) -> tensor<5x4xf32>

  return
}
