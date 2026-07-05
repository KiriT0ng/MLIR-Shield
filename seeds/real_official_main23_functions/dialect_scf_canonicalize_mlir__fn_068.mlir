func.func @execute_region_under_func_no_inline() {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 no_inline {
      %x = "test.val"() : () -> i64
      scf.yield %x : i64
    }
    "test.bar"(%v) : (i64) -> ()
  return
}
