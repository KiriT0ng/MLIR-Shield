func.func @test_log2_ceil_shape() -> !tosa.shape<4> {
  %a = tosa.const_shape {values = dense<[5, 7, 10, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %b = tosa.log2_ceil_shape %a : (!tosa.shape<4>) -> !tosa.shape<4>
  return %b : !tosa.shape<4>
}
