func.func @shuffle_unused_v1_with_poison_idx(%v0 : vector<3xi32>, %v1 : vector<3xi32>) -> vector<3xi32> {
  %shuffle = vector.shuffle %v0, %v1 [4, -1, 3] : vector<3xi32>, vector<3xi32>
  return %shuffle : vector<3xi32>
}
