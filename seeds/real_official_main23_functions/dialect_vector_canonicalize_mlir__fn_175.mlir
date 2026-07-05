func.func @shuffle_both_operands_used(%v0 : vector<3xi32>, %v1 : vector<3xi32>) -> vector<4xi32> {
  %shuffle = vector.shuffle %v0, %v1 [0, 3, 1, 4] : vector<3xi32>, vector<3xi32>
  return %shuffle : vector<4xi32>
}
