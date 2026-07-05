func.func @argmax_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %11 = tosa.argmax %arg0 {axis = 0 : i32, nan_mode = PROPAGATE} : (tensor<5x4xf32>)  -> tensor<4xi32>
  return
}
