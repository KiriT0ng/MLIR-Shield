func.func @gather_int(%arg0: tensor<2x3x2xi32>, %arg1: tensor<2x3xi32>) -> () {
  %0 = tosa.gather %arg0, %arg1 : (tensor<2x3x2xi32>, tensor<2x3xi32>)  -> tensor<2x3x2xi32>
  return
}
