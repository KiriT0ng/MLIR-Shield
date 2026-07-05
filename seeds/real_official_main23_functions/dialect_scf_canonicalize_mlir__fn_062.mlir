func.func @combineIfsUsed(%arg0 : i1, %arg2: i64) -> (i32, i32) {
  %res = scf.if %arg0 -> i32 {
    %v = "test.firstCodeTrue"() : () -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.firstCodeFalse"() : () -> i32
    scf.yield %v2 : i32
  }
  %res2 = scf.if %arg0 -> i32 {
    %v = "test.secondCodeTrue"(%res) : (i32) -> i32
    scf.yield %v : i32
  } else {
    %v2 = "test.secondCodeFalse"(%res) : (i32) -> i32
    scf.yield %v2 : i32
  }
  return %res, %res2 : i32, i32
}
