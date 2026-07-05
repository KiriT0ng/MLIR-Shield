func.func @shuffle_unused_v2_multidim(%v0 : vector<4x2xf32>, %v1 : vector<3x2xf32>) -> vector<3x2xf32> {
  %shuffle = vector.shuffle %v0, %v1 [2, 0, 3] : vector<4x2xf32>, vector<3x2xf32>
  return %shuffle : vector<3x2xf32>
}
