func.func @mul_no_const_shift(%arg0: tensor<2x3xi32>, %arg1: tensor<2x3xi32>, %arg2: tensor<1xi8>) -> tensor<2x3xi32> {
  %0 = tosa.mul %arg0, %arg1, %arg2 : (tensor<2x3xi32>, tensor<2x3xi32>, tensor<1xi8>) -> tensor<2x3xi32>
  return %0 : tensor<2x3xi32>
}
