func.func @test_0d_input(%arg0: tensor<i32>) -> () {
  %shift1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.mul %arg0, %arg0, %shift1 : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>

  %in_zp = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
  %out_zp = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
  %5 = tosa.negate %arg0, %in_zp, %out_zp : (tensor<i32>, tensor<1xi32>, tensor<1xi32>) -> tensor<i32>

  return
}
