func.func @minimum_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %7 = tosa.minimum %arg0, %arg1 {nan_mode = PROPAGATE} : (tensor<5x4xf32>, tensor<5x4xf32>) -> tensor<5x4xf32>
  return
}
