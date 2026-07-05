func.func @test_sub_i8_wrap2() -> i8 {
  %cst10 = arith.constant 10 : i8
  %0 = test.with_bounds { umin = 0 : i8, umax = 15 : i8, smin = 0 : i8, smax = 15 : i8 } : i8
  // umin underflows
  %1 = arith.subi %0, %cst10 overflow<nsw> : i8
  %2 = test.reflect_bounds %1 : i8
  return %2: i8
}
