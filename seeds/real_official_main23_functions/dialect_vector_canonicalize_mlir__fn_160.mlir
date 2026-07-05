func.func @shuffle_1d_poison_idx() -> vector<4xi32> {
  %v0 = arith.constant dense<[10, 11, 12]> : vector<3xi32>
  %v1 = arith.constant dense<[13, 14, 15]> : vector<3xi32>
  %shuffle = vector.shuffle %v0, %v1 [3, -1, 5, -1] : vector<3xi32>, vector<3xi32>
  return %shuffle : vector<4xi32>
}
