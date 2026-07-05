func.func @combineIfsNot(%arg0 : i1, %arg2: i64) {
  %true = arith.constant true
  %not = arith.xori %arg0, %true : i1
  scf.if %arg0 {
    "test.firstCodeTrue"() : () -> ()
    scf.yield
  }
  scf.if %not {
    "test.secondCodeTrue"() : () -> ()
    scf.yield
  }
  return
}
