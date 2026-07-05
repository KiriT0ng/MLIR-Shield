func.func @clamp_f16_is_noop(%arg0: tensor<4xf16>) -> tensor<4xf16> {
  // 0x7C00 and 0xFC00 are respectively positive and negative F32 infinity.
  %0 = tosa.clamp %arg0 {max_val = 0x7C00 : f16, min_val = 0xFC00 : f16} : (tensor<4xf16>) -> tensor<4xf16>
  return %0 : tensor<4xf16>
}
