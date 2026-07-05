func.func @bitcastSameType(%arg : f32) -> f32 {
  %res = arith.bitcast %arg : f32 to f32
  return %res : f32
}
