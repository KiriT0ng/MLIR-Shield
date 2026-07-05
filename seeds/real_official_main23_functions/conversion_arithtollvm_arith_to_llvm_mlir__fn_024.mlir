func.func @experimental_constrained_subf(%arg0 : f64, %arg1 : f64) {
  %0 = arith.subf %arg0, %arg1 to_nearest_even : f64
  %1 = arith.subf %arg0, %arg1 downward : f64
  return
}
