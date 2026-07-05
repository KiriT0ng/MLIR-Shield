func.func @ceildivui(%arg0 : i32) -> i32 {
  %0 = arith.ceildivui %arg0, %arg0 : i32
  return %0: i32
}
