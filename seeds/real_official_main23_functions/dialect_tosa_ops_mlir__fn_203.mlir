func.func @test_add_shape() -> !tosa.shape<4> {
  %a = tosa.const_shape {values = dense<[1, 2, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %b = tosa.const_shape {values = dense<[5, 6, 7, 8]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %c = tosa.add_shape %a, %b : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
  return %c : !tosa.shape<4>
}
