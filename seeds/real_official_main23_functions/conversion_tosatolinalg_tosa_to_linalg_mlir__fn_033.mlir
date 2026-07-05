func.func @reduce_float_dyn_multiple(%arg0: tensor<?x?xf32>) -> () {
  %0 = tosa.reduce_max %arg0 {axis = 1 : i32} : (tensor<?x?xf32>) -> tensor<?x1xf32>
  return
}
