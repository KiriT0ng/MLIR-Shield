func.func @truncUitofp(%arg0: i32) -> f32 {
  %uitofp = arith.uitofp %arg0 : i32 to f64
  %trunc = arith.truncf %uitofp : f64 to f32
  return %trunc : f32
}
