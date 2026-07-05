func.func @gather_float_dyn(%arg0: tensor<?x3x2xf32>, %arg1: tensor<?x3xi32>) -> () {
  %0 = tosa.gather %arg0, %arg1 : (tensor<?x3x2xf32>, tensor<?x3xi32>)  -> tensor<?x3x2xf32>
  return
}
