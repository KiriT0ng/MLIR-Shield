func.func @experimental_constrained_fptrunc(%arg0 : f64) {
  %0 = arith.truncf %arg0 to_nearest_even : f64 to f32
  %1 = arith.truncf %arg0 downward : f64 to f32
  %2 = arith.truncf %arg0 upward : f64 to f32
  %3 = arith.truncf %arg0 toward_zero : f64 to f32
  %4 = arith.truncf %arg0 to_nearest_away : f64 to f32
  return
}
