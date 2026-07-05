func.func @test_concat_shape() -> !tosa.shape<5> {
  %0 = tosa.const_shape {values = dense<[10]> : tensor<1xindex>} : () -> !tosa.shape<1>
  %1 = tosa.const_shape {values = dense<[10, 15]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %2 = tosa.const_shape {values = dense<[5, 2]> : tensor<2xindex>} : () -> !tosa.shape<2>
  %3 = tosa.concat_shape %0, %1, %2 : (!tosa.shape<1>, !tosa.shape<2>, !tosa.shape<2>) -> !tosa.shape<5>
  return %3 : !tosa.shape<5>
}
