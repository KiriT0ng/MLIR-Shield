func.func @replace_if_with_cond3(%arg0 : i1, %arg2: i64) -> (i32, i64) {
  %res:2 = scf.if %arg0 -> (i32, i64) {
    %v = "test.get_some_value"() : () -> i32
    scf.yield %v, %arg2 : i32, i64
  } else {
    %v2 = "test.get_some_value"() : () -> i32
    scf.yield %v2, %arg2 : i32, i64
  }
  return %res#0, %res#1 : i32, i64
}
