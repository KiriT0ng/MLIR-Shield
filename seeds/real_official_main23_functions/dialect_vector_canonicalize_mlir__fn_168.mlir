func.func @shuffle_fold4(%v0 : vector<4x5x6xi32>, %v1 : vector<2x5x6xi32>) -> vector<2x5x6xi32> {
  %shuffle = vector.shuffle %v0, %v1 [4, 5] : vector<4x5x6xi32>, vector<2x5x6xi32>
  return %shuffle : vector<2x5x6xi32>
}
