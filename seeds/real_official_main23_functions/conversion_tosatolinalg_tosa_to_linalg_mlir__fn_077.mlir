func.func @reduce_min_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %5 = tosa.reduce_min %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xf32>) -> tensor<1x4xf32>
  return
}
