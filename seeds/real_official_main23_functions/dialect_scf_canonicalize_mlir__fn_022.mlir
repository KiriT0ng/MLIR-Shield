func.func @merge_nested_if(%arg0: i1, %arg1: i1) {
  scf.if %arg0 {
    scf.if %arg1 {
      "test.op"() : () -> ()
      scf.yield
    }
    scf.yield
  }
  return
}
