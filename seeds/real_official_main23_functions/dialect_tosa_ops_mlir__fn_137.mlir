func.func @test_const(%arg0 : index) -> tensor<4xi32> {
    %0 = "tosa.const"() {values = dense<[3, 0, 1, 2]> : tensor<4xi32>} : () -> tensor<4xi32>
    return %0 : tensor<4xi32>
}
