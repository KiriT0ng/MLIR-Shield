func.func @execute_region_inline() {
  affine.for %i = 0 to 100 {
    "test.foo"() : () -> ()
    %v = scf.execute_region -> i64 {
      %x = "test.val"() : () -> i64
      scf.yield %x : i64
    }
    "test.bar"(%v) : (i64) -> ()
  }
  return
}
