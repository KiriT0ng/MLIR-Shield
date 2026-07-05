func.func @test_tile_f8E5M2(%arg0: tensor<13x21x3xf8E5M2>) -> tensor<39x21x6xf8E5M2> {
  %cst = tosa.const_shape { values = dense<[3, 1, 2]> : tensor<3xindex> } : () -> !tosa.shape<3>
  %0 = tosa.tile %arg0, %cst: (tensor<13x21x3xf8E5M2>, !tosa.shape<3>) -> tensor<39x21x6xf8E5M2>
  return %0 : tensor<39x21x6xf8E5M2>
}
