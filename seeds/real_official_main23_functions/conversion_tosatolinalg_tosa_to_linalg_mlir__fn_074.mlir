func.func @reduce_max_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %4 = tosa.reduce_max %arg0 {axis = 0 : i32, nan_mode = PROPAGATE} : (tensor<5x4xf32>) -> tensor<1x4xf32>
  return
}
