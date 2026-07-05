func.func @fptosi(%arg0 : f32, %arg1 : f64) {
  %0 = arith.fptosi %arg0: f32 to i32
  %1 = arith.fptosi %arg0: f32 to i64
  %2 = arith.fptosi %arg1: f64 to i32
  %3 = arith.fptosi %arg1: f64 to i64
  return
}
