func.func @truncFPTowardZeroConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst toward_zero : f32 to bf16
  return %0 : bf16
}
