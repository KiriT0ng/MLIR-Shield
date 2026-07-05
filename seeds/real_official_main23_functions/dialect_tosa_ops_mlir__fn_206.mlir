func.func @test_mod_shape() -> !tosa.shape<4> {
  %a = tosa.const_shape {values = dense<[9, 12, 10, 5]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %b = tosa.const_shape {values = dense<[2, 5, 3, 4]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %c = tosa.mod_shape %a, %b : (!tosa.shape<4>, !tosa.shape<4>) -> !tosa.shape<4>
  return %c : !tosa.shape<4>
}
