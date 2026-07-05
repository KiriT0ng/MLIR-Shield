func.func @negative_from_elements_poison_constant_mix() -> vector<2xf32> {
  %0 = ub.poison : f32
  %c = arith.constant 1.0 : f32
  %1 = vector.from_elements %0, %c : vector<2xf32>
  return %1 : vector<2xf32>
}
