func.func @test_negate_no_const_2(%arg0: tensor<50x42xi16> ,%arg1: tensor<1xi16> , %arg2: tensor<1xi16> ) -> tensor<*xi16> {
  %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<50x42xi16>, tensor<1xi16>, tensor<1xi16>) -> tensor<50x42xi16>
  %cast = tensor.cast %0 : tensor<50x42xi16> to tensor<*xi16>
  return %cast : tensor<*xi16>
}
