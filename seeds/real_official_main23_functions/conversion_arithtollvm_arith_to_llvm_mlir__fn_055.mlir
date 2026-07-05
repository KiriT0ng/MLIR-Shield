func.func @ops_supporting_exact(i32, i32) {
^bb0(%arg0: i32, %arg1: i32):
  %0 = arith.shrsi %arg0, %arg1 exact : i32
  %1 = arith.shrui %arg0, %arg1 exact : i32
  %2 = arith.divsi %arg0, %arg1 exact : i32
  %3 = arith.divui %arg0, %arg1 exact : i32
  return
}
