func.func @test_shl_i8_wrap2() -> i8 {
  %cst3 = arith.constant 3 : i8
  %0 = test.with_bounds { umin = 10 : i8, umax = 20 : i8, smin = 10 : i8, smax = 20 : i8 } : i8
  // smax overflows
  %1 = arith.shli %0, %cst3 overflow<nuw> : i8
  %2 = test.reflect_bounds %1 : i8
  return %2: i8
}
