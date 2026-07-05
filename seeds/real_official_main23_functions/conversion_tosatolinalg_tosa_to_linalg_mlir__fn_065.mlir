func.func @table16(%arg0: tensor<6xi16>, %arg1: tensor<513xi16>) -> () {
  %0 = tosa.table %arg0, %arg1 : (tensor<6xi16>, tensor<513xi16>)  -> tensor<6xi32>
  return
}
