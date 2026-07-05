func.func @sitofp(%arg0 : i32, %arg1 : i64) {
  %0 = arith.sitofp %arg0: i32 to f32
  %1 = arith.sitofp %arg0: i32 to f64
  %2 = arith.sitofp %arg1: i64 to f32
  %3 = arith.sitofp %arg1: i64 to f64
  return
}
