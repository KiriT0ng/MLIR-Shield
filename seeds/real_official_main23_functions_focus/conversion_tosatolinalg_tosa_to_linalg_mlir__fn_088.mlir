func.func @clamp_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %13 = tosa.clamp %arg0 {min_val =  1.0 : f32, max_val = 5.0 : f32, nan_mode = PROPAGATE} : (tensor<5x4xf32>) -> tensor<5x4xf32>
  return
}
