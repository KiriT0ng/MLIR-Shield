func.func @while_cond_true() -> i1 {
  %0 = scf.while () : () -> i1 {
    %condition = "test.condition"() : () -> i1
    scf.condition(%condition) %condition : i1
  } do {
  ^bb0(%arg0: i1):
    "test.use"(%arg0) : (i1) -> ()
    scf.yield
  }
  return %0 : i1
}
