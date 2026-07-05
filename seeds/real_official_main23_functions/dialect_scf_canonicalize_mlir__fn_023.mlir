func.func @merge_yielding_nested_if(%arg0: i1, %arg1: i1) -> (i32, f32, i32, i8) {
  %0 = "test.op"() : () -> (i32)
  %1 = "test.op1"() : () -> (f32)
  %2 = "test.op2"() : () -> (i32)
  %3 = "test.op3"() : () -> (i8)
  %r:4 = scf.if %arg0 -> (i32, f32, i32, i8) {
    %a:2 = scf.if %arg1 -> (i32, f32) {
      %i = "test.inop"() : () -> (i32)
      %i1 = "test.inop1"() : () -> (f32)
      scf.yield %i, %i1 : i32, f32
    } else {
      scf.yield %2, %1 : i32, f32
    }
    scf.yield %0, %a#1, %a#0, %3 : i32, f32, i32, i8
  } else {
    scf.yield %0, %1, %2, %3 : i32, f32, i32, i8
  }
  return %r#0, %r#1, %r#2, %r#3 : i32, f32, i32, i8
}
