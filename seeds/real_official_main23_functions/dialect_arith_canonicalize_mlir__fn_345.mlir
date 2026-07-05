func.func @addf_poison2(%arg: f32) -> f32 {
  %0 = ub.poison : f32
  %1 = arith.addf %arg, %0 : f32
  return %1 : f32
}
