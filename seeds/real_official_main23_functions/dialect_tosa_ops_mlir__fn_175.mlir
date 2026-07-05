func.func @test_const_f8E4M3FN(%arg0 : index) -> tensor<4xf8E4M3FN> {
    %0 = "tosa.const"() {values = dense<[3.0, -0.0, -1.0, 2.0]> : tensor<4xf8E4M3FN>} : () -> tensor<4xf8E4M3FN>
    return %0 : tensor<4xf8E4M3FN>
}
