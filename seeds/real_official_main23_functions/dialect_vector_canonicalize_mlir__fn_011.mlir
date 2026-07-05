func.func @extract_scalar_poison() -> f32 {
  %0 = ub.poison : vector<4x8xf32>
  %1 = vector.extract %0[2, 4] : f32 from vector<4x8xf32>
  return %1 : f32
}
