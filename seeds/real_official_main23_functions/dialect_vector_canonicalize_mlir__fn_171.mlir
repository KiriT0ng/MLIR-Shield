func.func @shuffle_unused_v1(%v0 : vector<3xi32>, %v1 : vector<3xi32>) -> vector<2xi32> {
  %shuffle = vector.shuffle %v0, %v1 [4, 3] : vector<3xi32>, vector<3xi32>
  return %shuffle : vector<2xi32>
}
