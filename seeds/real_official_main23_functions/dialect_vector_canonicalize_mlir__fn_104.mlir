func.func @fold_consecutive_broadcasts(%a : i32) -> vector<4x16xi32> {
  %1 = vector.broadcast %a : i32 to vector<16xi32>
  %2 = vector.broadcast %1 : vector<16xi32> to vector<4x16xi32>
  return %2 : vector<4x16xi32>
}
