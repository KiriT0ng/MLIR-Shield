func.func @shuffle_nofold1(%v0 : vector<4xi32>, %v1 : vector<2xi32>) -> vector<5xi32> {
  %shuffle = vector.shuffle %v0, %v1 [0, 1, 2, 3, 4] : vector<4xi32>, vector<2xi32>
  return %shuffle : vector<5xi32>
}
