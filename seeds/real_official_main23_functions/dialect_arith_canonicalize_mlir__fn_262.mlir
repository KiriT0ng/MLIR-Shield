func.func @test_divf_rounding_mode(%arg0 : f32) -> (f32, f32, f32) {
  %a = arith.constant 1.0 : f32
  %b = arith.constant 3.0 : f32
  // divf(x, 1) folds even with a rounding mode.
  %c1 = arith.constant 1.0 : f32
  %0 = arith.divf %arg0, %c1 toward_zero : f32
  %1 = arith.divf %a, %b upward : f32
  %2 = arith.divf %a, %b downward : f32
  return %0, %1, %2 : f32, f32, f32
}
