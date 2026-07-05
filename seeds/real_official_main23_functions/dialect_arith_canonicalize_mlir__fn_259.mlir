func.func @test_addf_rounding_mode(%arg0 : f32) -> (f32, f32, f32) {
  %a = arith.constant 1.0000001 : f32
  %b = arith.constant 1.0 : f32
  // addf(x, -0) folds even with a rounding mode.
  %c_neg0 = arith.constant -0.0 : f32
  %0 = arith.addf %arg0, %c_neg0 to_nearest_even : f32
  %1 = arith.addf %a, %b upward : f32
  %2 = arith.addf %a, %b downward : f32
  return %0, %1, %2 : f32, f32, f32
}
