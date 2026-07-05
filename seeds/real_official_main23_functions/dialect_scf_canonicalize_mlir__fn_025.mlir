func.func @merge_yielding_nested_if_nv2(%arg0: i1, %arg1: i1) -> i32 {
  %0 = "test.op"() : () -> (i32)
  %1 = "test.op1"() : () -> (i32)
  %r = scf.if %arg0 -> i32 {
    scf.if %arg1 {
      "test.run"() : () -> ()
    }
    scf.yield %0 : i32
  } else {
    scf.yield %1 : i32
  }
  return %r : i32
}
