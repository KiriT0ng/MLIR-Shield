func.func @argmax(%arg0 : tensor<3x2xi32>, %arg1 : tensor<6xf32>) -> () {
  %0 = tosa.argmax %arg0 { axis = 0 : i32} : (tensor<3x2xi32>)  -> tensor<2xi32>

  %1 = tosa.argmax %arg0 { axis = 1 : i32} : (tensor<3x2xi32>)  -> tensor<3xi32>

  %2 = tosa.argmax %arg1 { axis = 0 : i32} : (tensor<6xf32>)  -> tensor<i32>

  return
}
