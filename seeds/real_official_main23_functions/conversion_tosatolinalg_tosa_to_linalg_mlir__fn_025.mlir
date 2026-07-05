func.func @test_negate_no_const_1(%arg0: tensor<50x42xf16> ,%arg1: tensor<1xf16> , %arg2: tensor<1xf16> ) -> tensor<*xf16> {
  %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<50x42xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<50x42xf16>
  %cast = tensor.cast %0 : tensor<50x42xf16> to tensor<*xf16>
  return %cast : tensor<*xf16>
}
