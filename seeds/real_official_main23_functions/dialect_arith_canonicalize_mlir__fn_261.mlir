func.func @test_mulf_rounding_mode(%arg0 : f32) -> (f32, f32, f32) {
  %a = arith.constant 1.0000001 : f32
  %b = arith.constant 3.0 : f32
  // mulf(x, 1) folds even with a rounding mode.
  %c1 = arith.constant 1.0 : f32
  %0 = arith.mulf %arg0, %c1 upward : f32
  %1 = arith.mulf %a, %b upward : f32
  %2 = arith.mulf %a, %b downward : f32
  return %0, %1, %2 : f32, f32, f32
}
