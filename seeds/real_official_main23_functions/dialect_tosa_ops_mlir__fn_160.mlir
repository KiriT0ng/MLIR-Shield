func.func @test_reshape_f8E5M2(%arg0: tensor<13x21x3xf8E5M2>) -> tensor<1x819xf8E5M2> {
  %1 = tosa.const_shape {values = dense<[1, 819]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %0 = tosa.reshape %arg0, %1 : (tensor<13x21x3xf8E5M2>, !tosa.shape<2>) -> tensor<1x819xf8E5M2>
  return %0 : tensor<1x819xf8E5M2>
}
