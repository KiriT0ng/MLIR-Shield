func.func @test_negate_quantized(%arg0: tensor<1xi8>) -> () {
  %in_zp0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %out_zp0 = "tosa.const"() <{values = dense<7> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.negate %arg0, %in_zp0, %out_zp0 : (tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1xi8>

  %in_zp3 = "tosa.const"() <{values = dense<-128> : tensor<1xi8>}> : () -> tensor<1xi8>
  %out_zp3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %3 = tosa.negate %arg0, %in_zp3, %out_zp3 : (tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1xi8>

  %in_zp4 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %out_zp4 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %4 = tosa.negate %arg0, %in_zp4, %out_zp4 : (tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1xi8>

  return
}
