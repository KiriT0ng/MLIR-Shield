func.func @replace_false_if_with_values() {
  %false = arith.constant false
  %0 = scf.if %false -> (i32) {
    %1 = "test.op"() : () -> i32
    scf.yield %1 : i32
  } else {
    %2 = "test.other_op"() : () -> i32
    scf.yield %2 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}
