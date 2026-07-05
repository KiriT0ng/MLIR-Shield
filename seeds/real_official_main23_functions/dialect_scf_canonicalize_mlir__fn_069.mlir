func.func @func_execute_region_inline() {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 {
      %c = "test.cmp"() : () -> i1
      cf.cond_br %c, ^bb2, ^bb3
    ^bb2:
      %x = "test.val1"() : () -> i64
      cf.br ^bb4(%x : i64)
    ^bb3:
      %y = "test.val2"() : () -> i64
      cf.br ^bb4(%y : i64)
    ^bb4(%z : i64):
      scf.yield %z : i64
    }
    "test.bar"(%v) : (i64) -> ()
  return
}
