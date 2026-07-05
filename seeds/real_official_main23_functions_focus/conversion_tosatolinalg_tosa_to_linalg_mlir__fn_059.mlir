func.func @argmax_dyn_axis(%arg0 : tensor<3x?xi32>) -> () {
  %0 = tosa.argmax %arg0 { axis = 1 : i32} : (tensor<3x?xi32>)  -> tensor<3xi32>
  return
}
