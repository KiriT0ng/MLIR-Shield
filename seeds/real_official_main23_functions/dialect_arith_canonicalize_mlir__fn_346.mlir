func.func @negf_poison() -> f32 {
  %0 = ub.poison : f32
  %1 = arith.negf %0 : f32
  return %1 : f32
}
