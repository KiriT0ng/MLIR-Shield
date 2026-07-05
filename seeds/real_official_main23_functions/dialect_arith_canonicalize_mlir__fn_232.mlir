func.func @bitcastBackAndForth(%arg : i32) -> i32 {
  %f = arith.bitcast %arg : i32 to f32
  %res = arith.bitcast %f : f32 to i32
  return %res : i32
}
