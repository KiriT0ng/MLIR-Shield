func.func @combineIfsNot2(%arg0 : i1, %arg2: i64) {
  %true = arith.constant true
  %not = arith.xori %arg0, %true : i1
  scf.if %not {
    "test.firstCodeTrue"() : () -> ()
    scf.yield
  }
  scf.if %arg0 {
    "test.secondCodeTrue"() : () -> ()
    scf.yield
  }
  return
}
