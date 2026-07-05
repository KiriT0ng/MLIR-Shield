func.func @clamp_f32_is_noop(%arg0: tensor<4xf32>) -> tensor<4xf32> {
  // 0xFF800000 and 0x7F800000 are respectively negative and positive F32 infinity.
  %0 = tosa.clamp %arg0 {min_val = 0xFF800000 : f32, max_val = 0x7F800000 : f32} : (tensor<4xf32>) -> tensor<4xf32>
  return %0 : tensor<4xf32>
}
