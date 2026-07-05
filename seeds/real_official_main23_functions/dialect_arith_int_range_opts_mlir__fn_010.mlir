func.func @wraps() -> i8 {
  %c64 = arith.constant 64 : i8
  %val = test.with_bounds { umin = 63 : ui8, umax = 65 : ui8, smin = 63 : si8, smax = 65 : si8 } : i8
  %mod = arith.remsi %val, %c64 : i8
  return %mod : i8
}
