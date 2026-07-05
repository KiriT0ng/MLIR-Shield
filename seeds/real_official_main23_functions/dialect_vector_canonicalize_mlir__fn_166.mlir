func.func @shuffle_fold2(%v0 : vector<4xi32>, %v1 : vector<2xi32>) -> vector<2xi32> {
  %shuffle = vector.shuffle %v0, %v1 [4, 5] : vector<4xi32>, vector<2xi32>
  return %shuffle : vector<2xi32>
}
