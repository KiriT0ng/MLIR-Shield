func.func @shuffle_canonicalize_0d(%v0 : vector<i32>, %v1 : vector<i32>) -> vector<1xi32> {
  %shuffle = vector.shuffle %v0, %v1 [0] : vector<i32>, vector<i32>
  return %shuffle : vector<1xi32>
}
