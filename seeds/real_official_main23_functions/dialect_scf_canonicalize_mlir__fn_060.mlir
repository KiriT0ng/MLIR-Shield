func.func @combineIfs3(%arg0 : i1, %arg2: i64) -> i32 {
  %res = scf.if %arg0 -> i32 {
    %v = "test.firstCodeTrue"() : () -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.firstCodeFalse"() : () -> i32
    scf.yield %v2 : i32
  }
  scf.if %arg0 {
    "test.secondCodeTrue"() : () -> ()
    scf.yield
  }
  return %res : i32
}
