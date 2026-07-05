func.func @bitcastPoisonFPtoI() -> i32 {
  %p = ub.poison : f32
  %res = arith.bitcast %p : f32 to i32
  return %res : i32
}
