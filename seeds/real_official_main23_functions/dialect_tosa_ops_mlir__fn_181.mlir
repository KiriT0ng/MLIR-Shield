func.func @test_slice_f8E4M3FN(%arg0: tensor<13x21x3xf8E4M3FN>) -> tensor<4x11x1xf8E4M3FN> {
  %size = tosa.const_shape {values = dense<[4, 11, 1]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %start = tosa.const_shape {values = dense<[6, 8, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %2 = tosa.slice %arg0, %start, %size : (tensor<13x21x3xf8E4M3FN>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xf8E4M3FN>
  return %2 : tensor<4x11x1xf8E4M3FN>
}
