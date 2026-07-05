func.func @experimental_constrained_addf(%arg0 : f64, %arg1 : f64) {
  %0 = arith.addf %arg0, %arg1 to_nearest_even : f64
  %1 = arith.addf %arg0, %arg1 downward : f64
  %2 = arith.addf %arg0, %arg1 upward : f64
  %3 = arith.addf %arg0, %arg1 toward_zero : f64
  %4 = arith.addf %arg0, %arg1 to_nearest_away : f64
  return
}
