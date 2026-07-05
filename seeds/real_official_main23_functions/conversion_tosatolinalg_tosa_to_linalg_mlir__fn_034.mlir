func.func @reduce_int(%arg0: tensor<5x4xi32>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<1x4xi32>

  %1 = tosa.reduce_sum %arg0 {axis = 1 : i32} : (tensor<5x4xi32>) -> tensor<5x1xi32>

  %2 = tosa.reduce_product %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<1x4xi32>

  %3 = tosa.reduce_min %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<1x4xi32>

  %4 = tosa.reduce_max %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<1x4xi32>
  return
}
