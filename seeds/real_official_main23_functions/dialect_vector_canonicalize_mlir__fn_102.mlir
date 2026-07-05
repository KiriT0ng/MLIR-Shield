func.func @broadcast_folding1() -> vector<4xi32> {
  %0 = arith.constant 42 : i32
  %1 = vector.broadcast %0 : i32 to vector<4xi32>
  return %1 : vector<4xi32>
}
