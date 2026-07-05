func.func @redundantSelectFalse(%arg0: i1, %arg1 : i32, %arg2 : i32, %arg3 : i32) -> i32 {
  %0 = arith.select %arg0, %arg1, %arg2 : i32
  %res = arith.select %arg0, %arg3, %0 : i32
  return %res : i32
}
