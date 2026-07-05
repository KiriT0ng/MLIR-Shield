func.func @test_assert_equal_shape() {
  %0 = tosa.const_shape {values = dense<[10, 15]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %1 = tosa.const_shape {values = dense<[5, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
  tosa.assert_equal_shape %0, %1 {allow_broadcast = true} : (!tosa.shape<2>, !tosa.shape<2>) -> ()
  return
}
