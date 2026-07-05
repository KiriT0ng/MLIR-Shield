func.func @test_add_i8_nowrap() -> i8 {
  %cst1 = arith.constant 1 : i8
  %0 = test.with_bounds { umin = 0 : i8, umax = 127 : i8, smin = 0 : i8, smax = 127 : i8 } : i8
  // nsw flag stops smax from overflowing
  %1 = arith.addi %0, %cst1 overflow<nsw> : i8
  %2 = test.reflect_bounds %1 : i8
  return %2: i8
}
