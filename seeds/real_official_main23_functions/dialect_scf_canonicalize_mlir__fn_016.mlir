func.func @for_yields_4() -> i32 {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %a = arith.constant 3 : i32
  %b = arith.constant 4 : i32
  %r = scf.for %i = %c0 to %c2 step %c1 iter_args(%0 = %a) -> i32 {
    scf.yield %b : i32
  }
  return %r : i32
}
