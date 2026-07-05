func.func @reverse_dyn(%arg0: tensor<?xi32>) -> () {
  %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<?xi32>) -> tensor<?xi32>
  return
}
