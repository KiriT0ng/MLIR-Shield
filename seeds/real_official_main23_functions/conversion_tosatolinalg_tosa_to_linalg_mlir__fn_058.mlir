func.func @argmax_dyn_non_axis(%arg0 : tensor<3x?xi32>) -> () {
  %0 = tosa.argmax %arg0 { axis = 0 : i32} : (tensor<3x?xi32>)  -> tensor<?xi32>
  return
}
