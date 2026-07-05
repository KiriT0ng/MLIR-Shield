func.func @test_tile_f8E4M3FN(%arg0: tensor<13x21x3xf8E4M3FN>) -> tensor<39x21x6xf8E4M3FN> {
  %cst = tosa.const_shape { values = dense<[3, 1, 2]> : tensor<3xindex> } : () -> !tosa.shape<3>
  %0 = tosa.tile %arg0, %cst: (tensor<13x21x3xf8E4M3FN>, !tosa.shape<3>) -> tensor<39x21x6xf8E4M3FN>
  return %0 : tensor<39x21x6xf8E4M3FN>
}
