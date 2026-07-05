func.func @truncSitofp(%arg0: i32) -> f32 {
  %sitofp = arith.sitofp %arg0 : i32 to f64
  %trunc = arith.truncf %sitofp : f64 to f32
  return %trunc : f32
}
