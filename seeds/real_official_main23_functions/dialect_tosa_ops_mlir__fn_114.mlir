func.func @test_slice_size(%arg0: tensor<13x21x3xf32>) -> tensor<7x11x1xf32> {
  %size = tosa.const_shape {values = dense<[7, 11, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %start = tosa.const_shape {values = dense<[6, 8, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %2 = tosa.slice %arg0, %start, %size : (tensor<13x21x3xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<7x11x1xf32>
  return %2 : tensor<7x11x1xf32>
}
