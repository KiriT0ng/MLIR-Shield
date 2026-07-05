func.func @test_pad_f8E5M2(%arg0: tensor<13x21x3xf8E5M2>) -> tensor<13x21x3xf8E5M2> {
  %padding = tosa.const_shape {values = dense<0> : tensor<6xindex>} : () -> !tosa.shape<6>
  %cst = "tosa.const"() { values = dense<-0.0> : tensor<1xf8E5M2> } : () -> tensor<1xf8E5M2>
  %0 = tosa.pad %arg0, %padding, %cst : (tensor<13x21x3xf8E5M2>, !tosa.shape<6>, tensor<1xf8E5M2>) -> tensor<13x21x3xf8E5M2>
  return %0 : tensor<13x21x3xf8E5M2>
}
