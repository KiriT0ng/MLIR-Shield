func.func @test_pad_explicit_value(%arg0: tensor<13x21x3xf32>) -> tensor<13x21x3xf32> {
  %0 = "tosa.const"() {values = dense<3.14> : tensor<1xf32>} : () -> tensor<1xf32>
  %padding = tosa.const_shape {values = dense<0> : tensor<6xindex>} : () -> !tosa.shape<6>
  %1 = tosa.pad %arg0, %padding, %0 : (tensor<13x21x3xf32>, !tosa.shape<6>, tensor<1xf32>) -> tensor<13x21x3xf32>
  return %1 : tensor<13x21x3xf32>
}
