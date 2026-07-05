func.func @uitofp(%arg0 : i32, %arg1 : i64) {
  %0 = arith.uitofp %arg0: i32 to f32
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.uitofp %arg1: i64 to f32
  %3 = arith.uitofp %arg1: i64 to f64
  return
}
