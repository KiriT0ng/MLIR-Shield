func.func @insert_splatlike(%x : i32) -> vector<2x4x3xi32> {
  %v0 = vector.broadcast %x : i32 to vector<4x3xi32>
  %v1 = vector.broadcast %x : i32 to vector<2x4x3xi32>
  %insert = vector.insert %v0, %v1[0] : vector<4x3xi32> into vector<2x4x3xi32>
  return %insert : vector<2x4x3xi32>
}
