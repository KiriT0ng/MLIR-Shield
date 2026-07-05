func.func @extFPConstant() -> f64 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.extf %cst : f32 to f64
  return %0 : f64
}
