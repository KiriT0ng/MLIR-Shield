func.func @ops_nneg_not_set(%arg0: i32) {
  %0 = arith.extui %arg0 : i32 to i64
  %1 = arith.uitofp %arg0 : i32 to f32
  return
}
