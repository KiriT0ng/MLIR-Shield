func.func @table8_dyn(%arg0: tensor<?xi8>, %arg1: tensor<512xi8>) -> () {
  %0 = tosa.table %arg0, %arg1 : (tensor<?xi8>, tensor<512xi8>)  -> tensor<?xi8>
  return
}
