func.func @foldOrXor5(%arg0: i32) -> i32 {
  %0 = arith.constant -1 : i32
  %1 = arith.xori %arg0, %0 : i32
  %2 = arith.ori %arg0, %1 : i32
  return %2 : i32
}
