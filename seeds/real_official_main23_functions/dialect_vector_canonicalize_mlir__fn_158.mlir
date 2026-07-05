func.func @shuffle_1d() -> vector<4xi32> {
  %v0 = arith.constant dense<[0, 1, 2]> : vector<3xi32>
  %v1 = arith.constant dense<[3, 4, 5]> : vector<3xi32>
  %shuffle = vector.shuffle %v0, %v1 [3, 2, 5, 1] : vector<3xi32>, vector<3xi32>
  return %shuffle : vector<4xi32>
}
