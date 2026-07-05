func.func @test_slice_shape() -> !tosa.shape<3> {
  %0 = tosa.const_shape {values = dense<[4, 5, 6, 7, 8, 9]> : tensor<6xindex>} : () -> !tosa.shape<6>
  %1 = "tosa.const"() {values = dense<1> : tensor<1xi32>} : () -> tensor<1xi32>
  %2 = "tosa.const"() {values = dense<3> : tensor<1xi32>} : () -> tensor<1xi32>
  %3 = tosa.slice_shape %0, %1, %2 : (!tosa.shape<6>, tensor<1xi32>, tensor<1xi32>) -> !tosa.shape<3>
  return %3 : !tosa.shape<3>
}
