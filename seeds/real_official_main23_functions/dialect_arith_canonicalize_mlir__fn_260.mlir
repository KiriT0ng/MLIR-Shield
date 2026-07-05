func.func @test_subf_rounding_mode(%arg0 : f32) -> (f32, f32, f32, f32) {
  %a = arith.constant 1.0000001 : f32
  %b = arith.constant -1.0 : f32
  // subf(x, +0) folds even with a rounding mode.
  %c0 = arith.constant 0.0 : f32
  %0 = arith.subf %arg0, %c0 downward : f32
  %1 = arith.subf %a, %b upward : f32
  %2 = arith.subf %a, %b downward : f32
  // subf(-0, x) must NOT fold to negf when a custom rounding mode is set.
  %c-0 = arith.constant -0.0 : f32
  %3 = arith.subf %c-0, %arg0 downward : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}
