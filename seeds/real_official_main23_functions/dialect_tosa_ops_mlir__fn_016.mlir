func.func @test_conv2d_quant_any(%arg0: tensor<1x4x4x4x!quant.any<i8<-8:7>>>, %arg1: tensor<8x1x1x4x!quant.any<i8<-8:7>>>, %arg2: tensor<8x!quant.any<i8<-8:7>>>) -> tensor<1x4x4x8x!quant.any<i32<-8:7>>> {
  %zp = "tosa.const" () { values = dense<0> : tensor<1xi8> } : () -> tensor<1xi8>
  %0 = tosa.conv2d %arg0, %arg1, %arg2, %zp, %zp {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>, local_bound = true} : (tensor<1x4x4x4x!quant.any<i8<-8:7>>>, tensor<8x1x1x4x!quant.any<i8<-8:7>>>, tensor<8x!quant.any<i8<-8:7>>>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x4x4x8x!quant.any<i32<-8:7>>>
  return %0 : tensor<1x4x4x8x!quant.any<i32<-8:7>>>
}
