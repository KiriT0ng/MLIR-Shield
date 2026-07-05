func.func @test_tile(%arg0: tensor<13x21x3xf32>) -> tensor<39x21x6xf32> {
  %cst = tosa.const_shape { values = dense<[3, 1, 2]> : tensor<3xindex> } : () -> !tosa.shape<3>
  %0 = tosa.tile %arg0, %cst: (tensor<13x21x3xf32>, !tosa.shape<3>) -> tensor<39x21x6xf32>
  return %0 : tensor<39x21x6xf32>
}
