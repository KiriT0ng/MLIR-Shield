func.func @truncExtf(%arg0: f32) -> f32 {
  %extf = arith.extf %arg0 : f32 to f64
  %trunc = arith.truncf %extf : f64 to f32
  return %trunc : f32
}
