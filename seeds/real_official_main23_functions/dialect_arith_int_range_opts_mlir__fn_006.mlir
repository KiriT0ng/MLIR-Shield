func.func @test() -> i8 {
  %cst1 = arith.constant 1 : i8
  %i8val = test.with_bounds { umin = 0 : i8, umax = 12 : i8, smin = 0 : i8, smax = 12 : i8 } : i8
  %shifted = arith.shli %i8val, %cst1 : i8
  %1 = test.reflect_bounds %shifted : i8
  return %1: i8
}
