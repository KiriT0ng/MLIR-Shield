func.func @selNotCond(%arg0: i1, %arg1 : i32, %arg2 : i32, %arg3 : i32, %arg4 : i32) -> (i32, i32) {
  %one = arith.constant 1 : i1
  %cond1 = arith.xori %arg0, %one : i1
  %cond2 = arith.xori %one, %arg0 : i1

  %res1 = arith.select %cond1, %arg1, %arg2 : i32
  %res2 = arith.select %cond2, %arg3, %arg4 : i32
  return %res1, %res2 : i32, i32
}
