func.func @minimal_while() {
  %0 = "test.make_condition"() : () -> i1
  scf.while : () -> () {
    scf.condition(%0)
  } do {
    "test.some_payload"() : () -> ()
    scf.yield
  }
  return
}
