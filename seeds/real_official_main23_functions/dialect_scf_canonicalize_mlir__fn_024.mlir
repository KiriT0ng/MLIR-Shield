func.func @merge_yielding_nested_if_nv1(%arg0: i1, %arg1: i1) {
  %0 = "test.op"() : () -> (i32)
  %1 = "test.op1"() : () -> (f32)
  scf.if %arg0 {
    %a:2 = scf.if %arg1 -> (i32, f32) {
      %i = "test.inop"() : () -> (i32)
      %i1 = "test.inop1"() : () -> (f32)
      scf.yield %i, %i1 : i32, f32
    } else {
      scf.yield %0, %1 : i32, f32
    }
  }
  return
}
