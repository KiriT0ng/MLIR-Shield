func.func @while_unused_result() -> i32 {
  %0:2 = scf.while () : () -> (i32, i64) {
    %condition = "test.condition"() : () -> i1
    %v1 = "test.get_some_value"() : () -> i32
    %v2 = "test.get_some_value"() : () -> i64
    scf.condition(%condition) %v1, %v2 : i32, i64
  } do {
  ^bb0(%arg0: i32, %arg1: i64):
    "test.use"(%arg0) : (i32) -> ()
    scf.yield
  }
  return %0#0 : i32
}
