func.func @truncSitofpConstrained(%arg0: i32) -> f32 {
  %sitofp = arith.sitofp %arg0 : i32 to f64
  %trunc = arith.truncf %sitofp to_nearest_even : f64 to f32
  return %trunc : f32
}
