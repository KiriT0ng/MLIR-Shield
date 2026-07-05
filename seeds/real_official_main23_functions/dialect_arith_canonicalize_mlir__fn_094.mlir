func.func @truncExtf2(%arg0: bf16) -> f16 {
  %extf = arith.extf %arg0 : bf16 to f32
  %trunc = arith.truncf %extf : f32 to f16
  return %trunc : f16
}
