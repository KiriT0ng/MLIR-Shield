func.func @reduce_float_dyn(%arg0: tensor<?x5x4xf32>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 1 : i32} : (tensor<?x5x4xf32>) -> tensor<?x1x4xf32>
  return
}
