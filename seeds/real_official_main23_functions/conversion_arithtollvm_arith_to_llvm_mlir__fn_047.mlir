func.func @ceildivsi(%arg0 : i64, %arg1 : i64) -> i64 {
  %0 = arith.ceildivsi %arg0, %arg1 : i64
  return %0: i64
}
