func.func @replace_if_with_cond2(%arg0 : i1) -> (i32, i1) {
  %true = arith.constant true
  %false = arith.constant false
  %res:2 = scf.if %arg0 -> (i32, i1) {
    %v = "test.get_some_value"() : () -> i32
    scf.yield %v, %false : i32, i1
  } else {
    %v2 = "test.get_some_value"() : () -> i32
    scf.yield %v2, %true : i32, i1
  }
  return %res#0, %res#1 : i32, i1
}
