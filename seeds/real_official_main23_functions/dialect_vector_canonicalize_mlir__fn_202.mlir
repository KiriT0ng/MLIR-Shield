func.func @shuffle_splatlike(%x : i32) -> vector<4xi32> {
  %v0 = vector.broadcast %x : i32 to vector<4xi32>
  %v1 = vector.broadcast %x : i32 to vector<2xi32>
  %shuffle = vector.shuffle %v0, %v1 [2, 3, 4, 5] : vector<4xi32>, vector<2xi32>
  return %shuffle : vector<4xi32>
}
