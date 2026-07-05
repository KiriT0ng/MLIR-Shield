func.func @rescale_no_const_per_channel_input_output_zp_ui8(%arg0 : tensor<2xi8>, %arg1 : tensor<2xi32>, %arg2 : tensor<2xi8>, %input_zp : tensor<1xui8>, %output_zp : tensor<1xui8>) -> (tensor<2xui8>) {
    %0 = tosa.rescale %arg0, %arg1, %arg2, %input_zp, %output_zp {scale32 = true, rounding_mode = DOUBLE_ROUND, per_channel = true, input_unsigned = false, output_unsigned = true} : (tensor<2xi8>, tensor<2xi32>, tensor<2xi8>, tensor<1xui8>, tensor<1xui8>) -> tensor<2xui8>
  return %0 : tensor<2xui8>
}
