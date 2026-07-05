func.func @combineIfs4(%arg0 : i1, %arg2: i64) {
  scf.if %arg0 {
    "test.firstCodeTrue"() : () -> ()
    scf.yield
  }
  scf.if %arg0 {
    "test.secondCodeTrue"() : () -> ()
    scf.yield
  }
  return
}
