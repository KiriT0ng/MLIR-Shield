func.func @test_reshape_f8E4M3FN(%arg0: tensor<13x21x3xf8E4M3FN>) -> tensor<1x819xf8E4M3FN> {
  %1 = tosa.const_shape {values = dense<[1, 819]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %0 = tosa.reshape %arg0, %1 : (tensor<13x21x3xf8E4M3FN>, !tosa.shape<2>) -> tensor<1x819xf8E4M3FN>
  return %0 : tensor<1x819xf8E4M3FN>
}
