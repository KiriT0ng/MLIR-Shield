func.func @test_reshape_unranked_output(%arg0: tensor<13x21x3xf32>) -> tensor<*xf32> {
  %1 = tosa.const_shape {values = dense<[21, 13, 3]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %0 = tosa.reshape %arg0, %1 : (tensor<13x21x3xf32>, !tosa.shape<3>) -> tensor<*xf32>
  return %0 : tensor<*xf32>
}
