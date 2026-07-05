func.func @truncExtf1(%arg0: bf16) -> bf16 {
  %extf = arith.extf %arg0 : bf16 to f32
  %trunc = arith.truncf %extf : f32 to bf16
  return %trunc : bf16
}
