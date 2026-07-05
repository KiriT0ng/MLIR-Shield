func.func @test_mul_i8_nowrap() -> i8 {
  %cst10 = arith.constant 10 : i8
  %0 = test.with_bounds { umin = 10 : i8, umax = 20 : i8, smin = 10 : i8, smax = 20 : i8 } : i8
  // nsw stops overflow
  %1 = arith.muli %0, %cst10 overflow<nsw> : i8
  %2 = test.reflect_bounds %1 : i8
  return %2: i8
}
