func.func @propagate_into_execute_region() {
  %cond = arith.constant 0 : i1
  affine.for %i = 0 to 100 {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 {
      cf.cond_br %cond, ^bb1, ^bb2

    ^bb1:
      %c1 = arith.constant 1 : i64
      cf.br ^bb3(%c1 : i64)

    ^bb2:
      %c2 = arith.constant 2 : i64
      cf.br ^bb3(%c2 : i64)

    ^bb3(%x : i64):
      scf.yield %x : i64
    }
    "test.bar"(%v) : (i64) -> ()
  }
  return
}
