func.func @reduce_bool(%arg0: tensor<5x4xi1>) -> () {
  %0 = tosa.reduce_all %arg0 {axis = 0 : i32} : (tensor<5x4xi1>) -> tensor<1x4xi1>

  %1 = tosa.reduce_any %arg0 {axis = 0 : i32} : (tensor<5x4xi1>) -> tensor<1x4xi1>

  return
}
