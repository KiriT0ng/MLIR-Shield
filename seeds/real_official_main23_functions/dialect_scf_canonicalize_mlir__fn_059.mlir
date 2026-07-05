func.func @combineIfs2(%arg0 : i1, %arg2: i64) -> i32 {
  scf.if %arg0 {
    "test.firstCodeTrue"() : () -> ()
    scf.yield
  }
  %res = scf.if %arg0 -> i32 {
    %v = "test.secondCodeTrue"() : () -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.secondCodeFalse"() : () -> i32
    scf.yield %v2 : i32
  }
  return %res : i32
}
