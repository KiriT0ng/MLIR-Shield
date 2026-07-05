func.func @gather_float_all_dynamic(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xi32>) -> () {
  %0 = tosa.gather %arg0, %arg1 : (tensor<?x?x?xf32>, tensor<?x?xi32>)  -> tensor<?x?x?xf32>
  return
}
