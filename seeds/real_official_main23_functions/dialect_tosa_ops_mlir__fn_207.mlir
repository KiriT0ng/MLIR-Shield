func.func @test_div_ceil_shape() -> !tosa.shape<4> {
  %a = tosa.const_shape {values = dense<[5, 7, 10, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %b = tosa.const_shape {values = dense<[2, 3, 4, 3]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %c = tosa.div_ceil_shape %a, %b : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
  return %c : !tosa.shape<4>
}
