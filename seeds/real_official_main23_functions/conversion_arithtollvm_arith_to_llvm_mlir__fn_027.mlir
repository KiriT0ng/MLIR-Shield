func.func @constrained_addf_with_fastmath(%arg0 : f64, %arg1 : f64) {
  %0 = arith.addf %arg0, %arg1 to_nearest_even fastmath<fast> : f64
  return
}
