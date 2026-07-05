func.func @clamp_int16_is_noop(%arg0: tensor<4xi16>) -> tensor<4xi16> {
  %0 = tosa.clamp %arg0 {min_val = -32768 : i16, max_val = 32767 : i16} :  (tensor<4xi16>) -> tensor<4xi16>
  return %0 : tensor<4xi16>
}
