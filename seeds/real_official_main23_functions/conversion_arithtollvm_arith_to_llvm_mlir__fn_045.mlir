func.func @select(%arg0 : i1, %arg1 : i32, %arg2 : i32) -> i32 {
  %0 = arith.select %arg0, %arg1, %arg2 : i32
  return %0 : i32
}
