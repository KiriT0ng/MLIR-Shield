func.func @ops_supporting_nneg(%arg0: i32) {
  %0 = arith.extui %arg0 nneg : i32 to i64
  %1 = arith.uitofp %arg0 nneg : i32 to f32
  return
}
