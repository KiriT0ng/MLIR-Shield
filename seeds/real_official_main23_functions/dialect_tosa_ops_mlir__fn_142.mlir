func.func @test_const_shape() -> !tosa.shape<4> {
  %cst = tosa.const_shape {values = dense<1> : tensor<4xindex>} : () -> !tosa.shape<4>
  return %cst : !tosa.shape<4>
}
