func.func @clamp_int8_is_noop(%arg0: tensor<4xi8>) -> tensor<4xi8> {
  %0 = tosa.clamp %arg0 {min_val = -128 : i8, max_val = 127 : i8} :  (tensor<4xi8>) -> tensor<4xi8>
  return %0 : tensor<4xi8>
}
