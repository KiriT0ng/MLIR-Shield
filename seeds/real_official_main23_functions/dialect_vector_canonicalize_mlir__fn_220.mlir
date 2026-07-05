func.func @rank_1_shuffle_to_interleave(%arg0: vector<6xi32>, %arg1: vector<6xi32>) -> vector<12xi32> {
  %0 = vector.shuffle %arg0, %arg1 [0, 6, 1, 7, 2, 8, 3, 9, 4, 10, 5, 11] : vector<6xi32>, vector<6xi32>
  return %0 : vector<12xi32>
}
