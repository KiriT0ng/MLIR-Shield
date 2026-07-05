func.func @fptoui(%arg0 : f32, %arg1 : f64) {
  %0 = arith.fptoui %arg0: f32 to i32
  %1 = arith.fptoui %arg0: f32 to i64
  %2 = arith.fptoui %arg1: f64 to i32
  %3 = arith.fptoui %arg1: f64 to i64
  return
}
