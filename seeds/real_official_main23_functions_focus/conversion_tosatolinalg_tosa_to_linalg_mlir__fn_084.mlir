func.func @maximum_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %10 = tosa.maximum %arg0, %arg1 {nan_mode = IGNORE} : (tensor<5x4xf32>, tensor<5x4xf32>) -> tensor<5x4xf32>
  return
}
