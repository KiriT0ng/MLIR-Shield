func.func @remove_false_if() {
  %false = arith.constant false
  scf.if %false {
    "test.op"() : () -> ()
    scf.yield
  }
  return
}
