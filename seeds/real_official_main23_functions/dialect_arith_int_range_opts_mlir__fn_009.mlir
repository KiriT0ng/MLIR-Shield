func.func @non_const_rhs() -> i8 {
  %c64 = arith.constant 64 : i8
  %val = test.with_bounds { umin = 0 : ui8, umax = 2 : ui8, smin = 0 : si8, smax = 2 : si8 } : i8
  %rhs = test.with_bounds { umin = 63 : ui8, umax = 64 : ui8, smin = 63 : si8, smax = 64 : si8 } : i8
  %mod = arith.remui %val, %rhs : i8
  return %mod : i8
}
