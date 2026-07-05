func.func @experimental_constrained_mulf(%arg0 : f64, %arg1 : f64) {
  %0 = arith.mulf %arg0, %arg1 upward : f64
  %1 = arith.mulf %arg0, %arg1 toward_zero : f64
  return
}
