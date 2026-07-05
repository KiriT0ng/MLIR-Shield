func.func @remove_while_zero_iteration_loop() -> i64 {
  %init = "test.init"() : () -> i32
  %false = arith.constant false
  %0 = scf.while (%arg0 = %init) : (i32) -> (i64) {
    %inner1 = "test.before"(%arg0) : (i32) -> i64
    scf.condition(%false) %inner1 : i64
  } do {
  ^bb0(%arg1: i64):
    %inner2 = "test.before"(%arg1) : (i64) -> i32
    scf.yield %inner2 : i32
  }
  return %0 : i64
}
