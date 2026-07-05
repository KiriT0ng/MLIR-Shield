func.func @test_pad_f8E4M3FN(%arg0: tensor<13x21x3xf8E4M3FN>) -> tensor<13x21x3xf8E4M3FN> {
  %padding = tosa.const_shape {values = dense<0> : tensor<6xindex>} : () -> !tosa.shape<6>
  %cst = "tosa.const"() { values = dense<-0.0> : tensor<1xf8E4M3FN> } : () -> tensor<1xf8E4M3FN>
  %0 = tosa.pad %arg0, %padding, %cst : (tensor<13x21x3xf8E4M3FN>, !tosa.shape<6>, tensor<1xf8E4M3FN>) -> tensor<13x21x3xf8E4M3FN>
  return %0 : tensor<13x21x3xf8E4M3FN>
}
