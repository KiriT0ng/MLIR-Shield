func.func @experimental_constrained_divf(%arg0 : f64, %arg1 : f64) {
  %0 = arith.divf %arg0, %arg1 to_nearest_even : f64
  %1 = arith.divf %arg0, %arg1 to_nearest_away : f64
  return
}
