func.func @reduce_min_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %3 = tosa.reduce_min %arg0 {axis = 0 : i32, nan_mode = PROPAGATE} : (tensor<5x4xf32>) -> tensor<1x4xf32>
  return
}
