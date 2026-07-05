func.func @rescale_no_const(%arg0 : tensor<2xi8>, %multiplier : tensor<1xi32>, %shift : tensor<1xi8>, %input_zp : tensor<1xi8>, %output_zp : tensor<1xi8>) -> (tensor<2xi8>) {
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = true, rounding_mode = DOUBLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = false} : (tensor<2xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>
  return %0 : tensor<2xi8>
}
