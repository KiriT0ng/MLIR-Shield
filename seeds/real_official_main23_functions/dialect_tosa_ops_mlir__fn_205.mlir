func.func @test_mul_shape() -> !tosa.shape<4> {
  %a = tosa.const_shape {values = dense<[2, 3, 4, 5]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %b = tosa.const_shape {values = dense<[7, 0, 2, 6]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %c = tosa.mul_shape %a, %b : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
  return %c : !tosa.shape<4>
}
