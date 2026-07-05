func.func @test_const_f8E5M2(%arg0 : index) -> tensor<4xf8E5M2> {
    %0 = "tosa.const"() {values = dense<[3.0, -0.0, -1.0, 2.0]> : tensor<4xf8E5M2>} : () -> tensor<4xf8E5M2>
    return %0 : tensor<4xf8E5M2>
}
