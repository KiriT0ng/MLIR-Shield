func.func @pad_wh_avg_pool2d_nofold_pad_const(%input: tensor<1x10x8x3xi8>) -> tensor<1x6x5x3xi8> {
  %pad_shape = tosa.const_shape { values = dense<[0, 0, 1, 0, 1, 0, 0, 0]> : tensor<8xindex>} : () -> !tosa.shape<8>
  %pad_const = "tosa.const"() <{values = dense<15> : tensor<1xi8>}> : ()-> tensor<1xi8>
  %input_zp = "tosa.const"() <{values = dense<10> : tensor<1xi8>}> : ()-> tensor<1xi8>
  %output_zp = "tosa.const"() <{values = dense<20> : tensor<1xi8>}> : ()-> tensor<1xi8>
  %padded = tosa.pad %input, %pad_shape, %pad_const : (tensor<1x10x8x3xi8>, !tosa.shape<8>, tensor<1xi8>) -> tensor<1x11x9x3xi8>
  %pool = tosa.avg_pool2d %padded, %input_zp, %output_zp {acc_type = i32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 2, 2>} : (tensor<1x11x9x3xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x6x5x3xi8>
  return %pool : tensor<1x6x5x3xi8>
}
