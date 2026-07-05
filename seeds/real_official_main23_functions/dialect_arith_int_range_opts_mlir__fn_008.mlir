func.func @trivial_rem() -> i8 {
  %c64 = arith.constant 64 : i8
  %val = test.with_bounds { umin = 0 : ui8, umax = 63 : ui8, smin = 0 : si8, smax = 63 : si8 } : i8
  %mod = arith.remsi %val, %c64 : i8
  return %mod : i8
}
