func.func @test_bool(%arg0: tensor<1xi1>, %arg1: tensor<1xi1>) -> () {
  %0 = tosa.logical_and %arg0, %arg1 : (tensor<1xi1>, tensor<1xi1>) -> tensor<1xi1>

  %1 = tosa.logical_or %arg0, %arg1 : (tensor<1xi1>, tensor<1xi1>) -> tensor<1xi1>

  %2 = tosa.logical_xor %arg0, %arg1 : (tensor<1xi1>, tensor<1xi1>) -> tensor<1xi1>

  %3 = tosa.logical_not %arg0 : (tensor<1xi1>) -> tensor<1xi1>

  return
}
