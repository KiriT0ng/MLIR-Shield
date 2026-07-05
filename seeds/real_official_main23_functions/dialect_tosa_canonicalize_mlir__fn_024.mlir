func.func @clamp_uint8_is_noop(%arg0: tensor<4xui8>) -> tensor<4xui8> {
  %0 = tosa.clamp %arg0 {min_val = 0 : ui8, max_val = 255 : ui8} :  (tensor<4xui8>) -> tensor<4xui8>
  return %0 : tensor<4xui8>
}
