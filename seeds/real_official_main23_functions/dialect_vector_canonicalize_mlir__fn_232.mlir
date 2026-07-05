func.func @negative_from_elements_poison_f32() -> vector<2xf32> {
  %0 = ub.poison : f32
  %1 = vector.from_elements %0, %0 : vector<2xf32>
  return %1 : vector<2xf32>
}
