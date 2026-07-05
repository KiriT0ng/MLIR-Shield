func.func @fptrunc(%arg0 : f32, %arg1 : f64) {
  %0 = arith.truncf %arg0: f32 to f16
  %1 = arith.truncf %arg1: f64 to f16
  %2 = arith.truncf %arg1: f64 to f32
  return
}
