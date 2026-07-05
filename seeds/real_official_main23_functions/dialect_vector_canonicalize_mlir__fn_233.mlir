func.func @negative_from_elements_poison_i32() -> vector<2xi32> {
  %0 = ub.poison : i32
  %1 = vector.from_elements %0, %0 : vector<2xi32>
  return %1 : vector<2xi32>
}
