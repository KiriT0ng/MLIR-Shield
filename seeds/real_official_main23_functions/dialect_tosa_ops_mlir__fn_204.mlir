func.func @test_sub_shape() -> !tosa.shape<3> {
  %a = tosa.const_shape {values = dense<[10, 5, 3]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %b = tosa.const_shape {values = dense<[2, 1, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %c = tosa.sub_shape %a, %b : (!tosa.shape<3>, !tosa.shape<3>) -> !tosa.shape<3>
  return %c : !tosa.shape<3>
}
