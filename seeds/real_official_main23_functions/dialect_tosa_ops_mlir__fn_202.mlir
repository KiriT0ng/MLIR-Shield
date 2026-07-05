func.func @test_const_mxint8(%arg0 : index) -> tensor<2x!tosa.mxint8> {
    %0 = "tosa.const"() {values = dense<"0x007F"> : tensor<2x!tosa.mxint8>} : () -> tensor<2x!tosa.mxint8>
    return %0 : tensor<2x!tosa.mxint8>
}
