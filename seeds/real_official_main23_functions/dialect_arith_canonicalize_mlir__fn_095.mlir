func.func @truncExtf3(%arg0: f32) -> f16 {
  %extf = arith.extf %arg0 : f32 to f64
  %truncf = arith.truncf %extf : f64 to f16
  return %truncf : f16
}
