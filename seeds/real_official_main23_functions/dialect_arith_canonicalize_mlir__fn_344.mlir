func.func @addf_poison1(%arg: f32) -> f32 {
  %0 = ub.poison : f32
  %1 = arith.addf %0, %arg : f32
  return %1 : f32
}
