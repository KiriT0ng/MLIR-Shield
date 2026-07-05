func.func @shuffle_all_poison_mask(%v0 : vector<3xi32>, %v1 : vector<3xi32>) -> vector<2xi32> {
  %shuffle = vector.shuffle %v0, %v1 [-1, -1] : vector<3xi32>, vector<3xi32>
  return %shuffle : vector<2xi32>
}
