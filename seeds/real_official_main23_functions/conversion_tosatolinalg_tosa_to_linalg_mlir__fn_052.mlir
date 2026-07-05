func.func @reverse(%arg0: tensor<5x4xi32>) -> () {
  %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<5x4xi32>

  %1 = tosa.reverse %arg0 {axis = 1 : i32} : (tensor<5x4xi32>) -> tensor<5x4xi32>
  return
}
