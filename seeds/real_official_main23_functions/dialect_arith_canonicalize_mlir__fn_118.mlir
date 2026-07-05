func.func @truncFPToNearestEvenConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst to_nearest_even : f32 to bf16
  return %0 : bf16
}
