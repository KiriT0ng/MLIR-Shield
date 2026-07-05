func.func @bitcastPoisonItoFP() -> f32 {
  %p = ub.poison : i32
  %res = arith.bitcast %p : i32 to f32
  return %res : f32
}
