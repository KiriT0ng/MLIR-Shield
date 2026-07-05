func.func @shuffle_1d_rhs_lhs_poison() -> vector<4xi32> {
  %v0 = ub.poison : vector<3xi32>
  %v1 = ub.poison : vector<3xi32>
  %shuffle = vector.shuffle %v0, %v1 [3, 1, 5, 4] : vector<3xi32>, vector<3xi32>
  return %shuffle : vector<4xi32>
}
