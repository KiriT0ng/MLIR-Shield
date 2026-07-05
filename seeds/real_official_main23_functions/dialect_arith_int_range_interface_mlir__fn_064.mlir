func.func @test_shl_i8_nowrap() -> i8 {
  %cst3 = arith.constant 3 : i8
  %0 = test.with_bounds { umin = 10 : i8, umax = 20 : ui8, smin = 10 : i8, smax = 20 : i8 } : i8
  // nsw stops smax overflow
  %1 = arith.shli %0, %cst3 overflow<nsw> : i8
  %2 = test.reflect_bounds %1 : i8
  return %2: i8
}
