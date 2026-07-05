func.func @truncFPToNearestAwayConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst to_nearest_away : f32 to bf16
  return %0 : bf16
}
