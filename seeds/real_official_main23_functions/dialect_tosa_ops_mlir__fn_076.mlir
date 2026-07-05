func.func @main(%arg0: tensor<64xi32>, %arg1: tensor<513x!quant.uniform<i16:f32, 1.0:0>>) -> tensor<64x!quant.uniform<i16:f32, 1.0:0>> {
    %0 = tosa.table %arg0, %arg1 : (tensor<64xi32>, tensor<513x!quant.uniform<i16:f32, 1.000000e+00>>) -> tensor<64x!quant.uniform<i16:f32, 1.000000e+00>>
    return %0 : tensor<64x!quant.uniform<i16:f32, 1.0:0>>
}
